class Show < ActiveRecord::Base
  extend ActiveSupport::Memoizable  
    
  belongs_to :venue
  has_many :tickets
  has_many :wants
  
  def total_posts
    self.tickets.count + self.wants.count
  end
  
  def ticket_count
    self.tickets.inject(0){|i,t| i = i + t.quantity}
  end
  
  def wants_count
    self.wants.inject(0){|i,t| i = i + t.quantity}    
  end
  
  def rides_count
    self.tickets.inject(0){|i,t| i = i + 1 if t.needs_ride} + self.wants.inject(0){|i,t| i = i + 1 if t.needs_ride}    
  end
  
  def ratio
    if self.wants.count > 0
      x = (self.ticket_count.to_f/self.wants_count.to_f).to_f.round_to(2)
    else
      0.0
    end
  end
  
  memoize :total_posts, :ticket_count, :wants_count, :rides_count
end

