class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

def email_list
    self.subscriptions.collect do |subscription|
        subscription.email
    end
end

def self.most_popular
    self.all.max_by {|m| m.subscriptions.count}
end

end