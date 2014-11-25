class Info::RelationshipFinDtl < ActiveRecord::Base
  belongs_to :finance, :class_name => 'Info::CustomerFinance', foreign_key: :fin_id

  def proceed
    money = self.money
    self.status_id = 1
    self.save

    unless self.in_or_out
      money = 0 - money
    end

    self.finance.amount = self.finance.amount + money
    self.finance.save
  end
end
