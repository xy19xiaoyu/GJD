class Info::Relationship < ActiveRecord::Base
  def has_short_name?
    return self.shortName && !self.shortName.blank?
  end
end