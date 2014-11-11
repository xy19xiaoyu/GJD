class Info::CustomerFinance < ActiveRecord::Base
  belongs_to :customer, :class_name => 'Info::Customer', foreign_key: :customer_id
end
