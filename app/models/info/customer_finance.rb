class Info::CustomerFinance < ActiveRecord::Base
  has_history
  belongs_to :customer, :class_name => 'Info::Customer', foreign_key: :customer_id
  has_many :fin_dtls, :class_name => 'Info::CustomerFinDtl', foreign_key: :customer_fin_id
end
