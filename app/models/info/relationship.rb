class Info::Relationship < ActiveRecord::Base
  has_one :finance, :class_name => 'Info::RelationshipFinance', :foreign_key => :parent_id, :dependent => :destroy
  def has_short_name?
    return self.shortName && !self.shortName.blank?
  end
end