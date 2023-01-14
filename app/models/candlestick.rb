class Candlestick < ApplicationRecord
  belongs_to :merchandise_rate
  enum time_type: {day: 1, week: 2, month: 3, hour: 4, m15: 5}

  # date_between( "2022-05-10","2022-05-12")
  scope :date_between, lambda {|start_date, end_date| where("date >= ? AND date <= ?", start_date, end_date )}

  scope :find_by_merchandise_rate, -> merchandise_rate_id, time_type do
    where(merchandise_rate_id: merchandise_rate_id)
    .where(time_type: time_type)
    .order(date: :desc)
  end

  class << self
    def delete_duplicate
      Candlestick.where.not(id: Candlestick.group(:date, :time_type, :merchandise_rate_id).select("min(id)")).destroy_all
    end
  end
end
