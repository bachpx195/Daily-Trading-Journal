class Trade < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :coin, optional: true
  belongs_to :merchandise, optional: true
  belongs_to :currency_pair, optional: true
  has_one :trade_normal_method, dependent: :destroy
  has_one :trade_pyramid_method, dependent: :destroy
  has_one :log, dependent: :destroy

  accepts_nested_attributes_for :trade_normal_method
  accepts_nested_attributes_for :trade_pyramid_method
  accepts_nested_attributes_for :log

  enum status: {draft: 0, open: 1, close: 2}
  enum order_type: {sell: 0, buy: 1}
end
