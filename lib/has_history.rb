module HasHistory

  module ClassMethods
    def has_history(name=:histories, options = {})
      base_name = self.to_s.split('::')[-1] + 'History'
      unless defined?(base_name) && base_name.is_a?(Class)
        Common.const_set(base_name, create_tmp_class)
        self.has_many(name, :class_name => "Common::#{base_name}", foreign_key: :item_id)

        options[:create] = true if options[:create] == nil
        options[:destroy] = true if options[:destroy] == nil
        options[:update] = true if options[:update] == nil

        options.each do |key, value|
          if value
            eval("self.after_#{key} :after_#{key}_his")
          end
        end

        self.send(:include, InstanceMethods)
        self.send :class_variable_set, '@@tmp_his_attr', name
        self.cattr_accessor :tmp_his_attr
      end
    end

    def create_tmp_class
      Class.new(Common::OperationHistory)
    end
  end

  module InstanceMethods

    def respond_to?(method, pri=false)
      (method.to_s =~ /^after_(\w+)_his$/) || super
    end

    def method_missing(sym, *args)
      if sym.to_s =~ /^after_(\w+)_his$/
        pattern = $1
        attr_name = self.tmp_his_attr
        hisArr = instance_eval(attr_name.to_s)
        hisArr.build(:user_id => session[:user_id], :item_id => self.id, :op_type => pattern).save
      else
        super
      end
    end
  end
end

ActiveRecord::Base.send(:extend, HasHistory::ClassMethods)
