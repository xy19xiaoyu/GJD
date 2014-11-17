module GJD::EXT::HasHistory
  def has_history
    puts 'has_history'
  end
end

class ActiveRecord::Base
  extend GJD::EXT::HasHistory
end

ActiveRecord::Base.has_history