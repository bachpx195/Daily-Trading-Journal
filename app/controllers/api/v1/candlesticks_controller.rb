class Api::V1::CandlesticksController < Api::V1::BaseApiController
  def index
    limit_records = 100
    merchandise_rate_id = params[:merchandise_rate_id]
    time_type = params[:time_type].to_i

    # @candlesticks là các cây nến trong thời gian hiện tại (lấy limit_records cây)
    # @candlesticks_future là các cây nến trong thời gian tương lai để làm backtest (lấy thêm limit_records cây trong tương lai)
    if params[:date].present?
      date = params[:date].to_datetime
      start_date, end_date, next_date = Candlestick.range_between_date date, time_type, limit_records
      @candlesticks = Candlestick.find_by_merchandise_rate(merchandise_rate_id.to_i, time_type, limit_records)
        .time_between(start_date, date)
        .sort_by{|c| c.date.to_i}
      @candlesticks_future = Candlestick.find_by_merchandise_rate(merchandise_rate_id.to_i, time_type, limit_records)
        .time_between(next_date, end_date)
        .sort_by{|c| c.date.to_i}
    else
      @candlesticks = Candlestick.find_by_merchandise_rate(merchandise_rate_id.to_i, time_type, limit_records)
        .sort_by{|c| c.date.to_i}
      @candlesticks_future = []
    end
  end

  def async_update_data
    time_type = params["time_type"]
    result = true

    if time_type.present?
      result = CreateCandlestickService.new(params["merchandise_rate_ids"], Candlestick.time_types.key(params["time_type"])).execute
    else
      Candlestick.time_types.keys.each do |interval|
        result = result && CreateCandlestickService.new(params["merchandise_rate_ids"], interval).execute
      end
    end

    render json: result
  end
end
