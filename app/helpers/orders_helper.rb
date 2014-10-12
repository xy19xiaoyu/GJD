# encoding: utf-8
module OrdersHelper
  $OrderType ={"1" => "采购", "2" => "销售"}
  def self.getReviewsValues(key)
      return  $OrderType[key]
  end

  def self.getSplistUrl
    return ""
  end
end
