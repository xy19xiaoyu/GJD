class SubOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :go_downs
end
