class Origin::Site < ActiveRecord::Base
  has_many :sidebar_items, :class_name => 'Origin::SidebarItem', foreign_key: :site_id, dependent: :destroy, autosave: true
  @c_site
  def self.current_site
   # puts  "123:" +@c_site
    if @c_site
      @c_site.reload
    else
      @c_site = Origin::Site.first()
    end
    @c_site
  end
end
