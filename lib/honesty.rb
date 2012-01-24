require 'active_record'

# Honesty
module Honesty 

  def self.included(base)
    base.extend ClassMethods  
  end

  module ClassMethods
    def honesty
      has_many :facts, {:as => :honest, :dependent => :destroy}
      include Honesty::InstanceMethods
    end
  end

  module InstanceMethods
    def fact(*params)
    	if params.length == 3
	 		self.facts.create(:context => params[0], :agent => params[1], :action => params[2])
	 	elsif params.length == 2
	 		self.facts.create(:context => self.class.name, :agent => params[0], :action => params[1])
		end
	end
  end
end

ActiveRecord::Base.send(:include, Honesty)
