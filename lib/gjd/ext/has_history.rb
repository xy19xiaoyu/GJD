module HasHistory
  def has_history
    puts 'has_history'
  end
end

class ActiveRecord::Base
  extend HasHistory
end

ActiveRecord::Base.has_history

class BBB < ActiveRecord::Base
  has_history
end