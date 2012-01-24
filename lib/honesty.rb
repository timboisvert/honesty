require "honesty/version"
require 'active_record'

#this is HEAVILY influenced by aprihodko's acts_as_reportable gem
module ActiveRecord; module Acts; end; end
module ActiveRecord::Acts::Honesty

  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def honesty
      has_many :truths, :as => :honesty, :dependent => :destroy, :order => 'created_at ASC'
      include ActiveRecord::Acts::Honesty::InstanceMethods
    end
  end
  
  module InstanceMethods
    def truth(context, agent, action)
      truth = self.truths.new
      truth.context = context
      truth.agent = agent
      truth.action = action
      truth.save!
    end
    
    # Helper methods
    def truths_by_context
      Truth.find(:all,
        :conditions => ["context = ?", self.class.context],
        :order => "created_at DESC"
      )
    end
    def truths_by_agent
      Truth.find(:all,
        :conditions => ["agent = ?", self.class.agent],
        :order => "created_at DESC"
      )
    end
    def truths_by_action
      Truth.find(:all,
        :conditions => ["action = ?", self.class.action],
        :order => "created_at DESC"
      )
    end
  end
    
end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Honesty)