class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    subscription = Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
  end

  def total_subcription_price
    self.subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
  subscrip = self.subscriptions.find_by(magazine_id: magazine.id)
  subscrip.destroy
  end


end