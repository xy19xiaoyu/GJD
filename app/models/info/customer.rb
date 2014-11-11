class Info::Customer < ActiveRecord::Base
  has_one :finance, :class_name => 'Info::CustomerFinance', :foreign_key => :customer_id, :dependent => :destroy
  has_many :lowers, :class_name => 'Info::Customer', :foreign_key => :upper_id, :dependent => :nullify
  belongs_to :upper, :class_name => 'Info::Customer', :foreign_key => :upper_id
             after_create :create_finance_method
  before_create :generate_customer_num


  def has_short_name?
    return self.shortName && !self.shortName.blank?
  end

  private

  def generate_customer_num
    if Info::Customer.count == 0
      self.cid, self.tmp_cid = 'C00001', 1
    else
      _tmp_num = Info::Customer.order(:tmp_cid => :desc).first!.tmp_cid + 1
      self.tmp_cid = _tmp_num
      self.cid = 'C'+('0000' + _tmp_num.to_s)[-5..-1]
    end
  end

  def create_finance_method
    self.create_finance(:amount => 0) unless self.finance
  end
end
