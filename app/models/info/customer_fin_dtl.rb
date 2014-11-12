class Info::CustomerFinDtl < ActiveRecord::Base
  belongs_to :finance, :class_name => 'Info::CustomerFinance', foreign_key: :customer_fin_id
  before_create :generate_cfd_id

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

  private
  def generate_cfd_id
    cdate = Time.now.localtime().strftime('%Y%m%d')
    wherestr = "date_tmp = '#{cdate}'"
    if self.order_id.nil?
      autoWord = 'M'
      wherestr += ' and order_id is null'
    else
      autoWord = 'A'
      wherestr += ' and order_id is not null'
    end

    if Info::CustomerFinDtl.where(wherestr).count == 0
      self.cfd_id, self.date_tmp, self.num_tmp = 'CFD_' + autoWord + '_' + cdate + '0001', cdate, 1
    else
      _tmp_num = Info::CustomerFinDtl.where(wherestr).order(:num_tmp => :desc).first!.num_tmp + 1
      self.num_tmp = _tmp_num
      self.date_tmp = cdate
      self.cfd_id = 'CFD_' + autoWord + '_' + cdate + ('000' + _tmp_num.to_s)[-4..-1]
    end
  end
end
