# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_11_07_173422) do

  create_table "b_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "b_order_id"
    t.bigint "merchandise_rate_id"
    t.string "client_order"
    t.float "price"
    t.float "orig_qty"
    t.float "executed_qty"
    t.float "executed_quote_qty"
    t.integer "status"
    t.integer "type"
    t.integer "side"
    t.date "insert_time"
    t.date "update_time"
    t.float "delegate_money"
    t.float "avg_price"
    t.integer "orig_type"
    t.integer "position_side"
    t.float "profit"
    t.float "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchandise_rate_id"], name: "index_b_orders_on_merchandise_rate_id"
  end

  create_table "blog_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "blog_id"
    t.integer "blog_count"
    t.index ["blog_id"], name: "index_blog_tags_on_blog_id"
    t.index ["tag_id"], name: "index_blog_tags_on_tag_id"
  end

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "public_time"
    t.integer "public_status", default: 0, null: false
    t.string "intro_image"
    t.text "content"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candlesticks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "merchandise_rate_id"
    t.integer "time_type"
    t.float "open"
    t.float "high"
    t.float "close"
    t.float "low"
    t.float "atr14"
    t.datetime "date"
    t.float "volumn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchandise_rate_id"], name: "index_candlesticks_on_merchandise_rate_id"
  end

  create_table "ckeditor_assets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "coin_links", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.string "kind"
    t.bigint "coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_coin_links_on_coin_id"
  end

  create_table "coin_sources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "domain_slug"
    t.string "website"
    t.bigint "coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_coin_sources_on_coin_id"
  end

  create_table "coins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "description"
    t.string "code"
    t.integer "rank"
    t.integer "is_follow", default: 0
    t.string "meta_title"
    t.string "platform"
    t.bigint "tag_id"
    t.float "win_rate", default: 100.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_coins_on_tag_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.integer "is_importand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
  end

  create_table "daily_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.bigint "coin_id"
    t.bigint "new_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_daily_reports_on_coin_id"
    t.index ["new_id"], name: "index_daily_reports_on_new_id"
  end

  create_table "fund_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "log_id"
    t.float "change_amount"
    t.integer "change_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_fund_logs_on_log_id"
  end

  create_table "funds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "initial_capital"
    t.float "present_value"
    t.float "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glossaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "brief"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hour_analytics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "candlestick_id"
    t.date "date"
    t.integer "hour"
    t.float "return_oc"
    t.float "return_hl"
    t.integer "candlestick_type"
    t.integer "is_highest_return"
    t.integer "is_lowest_return"
    t.integer "day_session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candlestick_id"], name: "index_hour_analytics_on_candlestick_id"
  end

  create_table "idea_merchandises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "idea_id"
    t.bigint "merchandise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_merchandises_on_idea_id"
    t.index ["merchandise_id"], name: "index_idea_merchandises_on_merchandise_id"
  end

  create_table "idea_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "idea_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_plans_on_idea_id"
    t.index ["plan_id"], name: "index_idea_plans_on_plan_id"
  end

  create_table "ideas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "brief"
    t.string "image"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.datetime "start_at"
    t.float "rating", default: 3.0
    t.index ["tag_id"], name: "index_ideas_on_tag_id"
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.integer "status"
    t.float "result"
    t.text "note"
    t.float "money"
    t.float "fee"
    t.datetime "datetime"
    t.integer "rating"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "server_code"
    t.datetime "open_date"
    t.datetime "end_date"
    t.index ["trade_id"], name: "index_logs_on_trade_id"
  end

  create_table "merchandise_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "base_id"
    t.integer "quote_id"
    t.float "winrate"
    t.text "desciption"
    t.integer "is_follow", default: 0
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "liquid_rate", default: "0"
    t.string "crosses_related"
    t.text "brief"
    t.integer "spread", default: 0
    t.integer "range", default: 0
    t.index ["tag_id"], name: "index_merchandise_rates_on_tag_id"
  end

  create_table "merchandises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "desciption"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.text "brief"
    t.string "center_bank"
    t.index ["tag_id"], name: "index_merchandises_on_tag_id"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.text "short_description"
    t.string "tilte"
    t.date "published_at"
    t.integer "status"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "news_type", default: 0
    t.text "content"
    t.index ["tag_id"], name: "index_news_on_tag_id"
  end

  create_table "news_sites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "domain"
    t.text "description"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_news_sites_on_tag_id"
  end

  create_table "news_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "new_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_id"], name: "index_news_tags_on_new_id"
    t.index ["tag_id"], name: "index_news_tags_on_tag_id"
  end

  create_table "plan_merchandise_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "merchandise_rate_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchandise_rate_id"], name: "index_plan_merchandise_rates_on_merchandise_rate_id"
    t.index ["plan_id"], name: "index_plan_merchandise_rates_on_plan_id"
  end

  create_table "plan_merchandises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "merchandise_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchandise_id"], name: "index_plan_merchandises_on_merchandise_id"
    t.index ["plan_id"], name: "index_plan_merchandises_on_plan_id"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status"
    t.integer "category"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.bigint "tag_id"
    t.string "plan_image"
    t.index ["lft"], name: "index_plans_on_lft"
    t.index ["parent_id"], name: "index_plans_on_parent_id"
    t.index ["rgt"], name: "index_plans_on_rgt"
    t.index ["tag_id"], name: "index_plans_on_tag_id"
  end

  create_table "rule_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "rule_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_rule_histories_on_rule_id"
  end

  create_table "rules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "rule_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "value_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_follow", default: 0
    t.string "tag_image"
    t.index ["lft"], name: "index_tags_on_lft"
    t.index ["parent_id"], name: "index_tags_on_parent_id"
    t.index ["rgt"], name: "index_tags_on_rgt"
  end

  create_table "telegram_chat_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "telegram_chat_id"
    t.string "msg_id"
    t.text "content"
    t.datetime "chat_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telegram_chat_id"], name: "index_telegram_chat_messages_on_telegram_chat_id"
  end

  create_table "telegram_chats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "chat_id"
    t.string "telegram_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "win_rate"
    t.text "rule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_normal_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "trade_method_id"
    t.bigint "trade_id"
    t.float "point_entry"
    t.float "point_out"
    t.float "stop_loss"
    t.float "take_profit"
    t.integer "target"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_id"], name: "index_trade_normal_methods_on_trade_id"
    t.index ["trade_method_id"], name: "index_trade_normal_methods_on_trade_method_id"
  end

  create_table "trade_pyramid_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "trade_method_id"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_id"], name: "index_trade_pyramid_methods_on_trade_id"
    t.index ["trade_method_id"], name: "index_trade_pyramid_methods_on_trade_method_id"
  end

  create_table "trades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "coin_id"
    t.integer "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_pair_id"
    t.integer "order_type"
    t.bigint "merchandise_rate_id"
    t.index ["coin_id"], name: "index_trades_on_coin_id"
    t.index ["currency_pair_id"], name: "index_trades_on_currency_pair_id"
    t.index ["merchandise_rate_id"], name: "index_trades_on_merchandise_rate_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wikis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "brief"
    t.string "image"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "market_type", default: 0, null: false
    t.index ["tag_id"], name: "index_wikis_on_tag_id"
  end

  create_table "zones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "start_zone_id"
    t.integer "end_zone_id"
    t.integer "zone_type"
    t.integer "zone_size"
    t.float "high"
    t.float "low"
    t.bigint "merchandise_rate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_zone_id"], name: "index_zones_on_end_zone_id"
    t.index ["merchandise_rate_id"], name: "index_zones_on_merchandise_rate_id"
    t.index ["start_zone_id"], name: "index_zones_on_start_zone_id"
  end

  add_foreign_key "b_orders", "merchandise_rates"
  add_foreign_key "blog_tags", "blogs"
  add_foreign_key "blog_tags", "tags"
  add_foreign_key "candlesticks", "merchandise_rates"
  add_foreign_key "coin_links", "coins"
  add_foreign_key "coin_sources", "coins"
  add_foreign_key "coins", "tags"
  add_foreign_key "daily_reports", "coins"
  add_foreign_key "daily_reports", "news", column: "new_id"
  add_foreign_key "fund_logs", "logs"
  add_foreign_key "hour_analytics", "candlesticks"
  add_foreign_key "idea_merchandises", "ideas"
  add_foreign_key "idea_merchandises", "merchandises"
  add_foreign_key "idea_plans", "ideas"
  add_foreign_key "idea_plans", "plans"
  add_foreign_key "ideas", "tags"
  add_foreign_key "logs", "trades"
  add_foreign_key "merchandise_rates", "tags"
  add_foreign_key "merchandises", "tags"
  add_foreign_key "news", "tags"
  add_foreign_key "news_sites", "tags"
  add_foreign_key "news_tags", "news", column: "new_id"
  add_foreign_key "news_tags", "tags"
  add_foreign_key "plan_merchandise_rates", "merchandise_rates"
  add_foreign_key "plan_merchandise_rates", "plans"
  add_foreign_key "plan_merchandises", "merchandises"
  add_foreign_key "plan_merchandises", "plans"
  add_foreign_key "rule_histories", "rules"
  add_foreign_key "trade_normal_methods", "trade_methods"
  add_foreign_key "trade_normal_methods", "trades"
  add_foreign_key "trade_pyramid_methods", "trade_methods"
  add_foreign_key "trade_pyramid_methods", "trades"
  add_foreign_key "trades", "coins"
  add_foreign_key "wikis", "tags"
  add_foreign_key "zones", "merchandise_rates"
end
