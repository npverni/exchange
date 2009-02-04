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
    c = 0
    if self.tickets.any?
      c = c+  self.tickets.inject(0){|i,t| i = i + (t.needs_ride ? 1 : 0)}
    end
    if self.wants.any?
      c = c + self.wants.inject(0){|i,t| i = i + (t.needs_ride ? 1 : 0)}
    end
    c
  end
  
  def ratio
    if self.wants.count > 0
      x = (self.ticket_count.to_f/self.wants_count.to_f).to_f.round_to(2)
    else
      'NA'
    end
  end
  
  def friendly_name
    "#{show_date.strftime("%D") } #{venue.name}"
  end
  
  #class methods
  
  def self.total_posts
    Ticket.count + Want.count
  end
  
  def self.total_ticket_count
    Ticket.all.inject(0){|i,t| i = i + t.quantity}    
  end
  
  def self.total_wants_count
    Want.all.inject(0){|i,t| i = i + t.quantity}
  end
  
  def self.total_rides_count
    c = 0
    if Ticket.all.any?
      c = c + Ticket.all.inject(0){|i,t| i = i + (t.needs_ride ? 1 : 0)}
    end
    if
       +  Want.all.inject(0){|i,t| i = i + (t.needs_ride ? 1 : 0)}    
    end
    c
  end
  
  def self.total_ratio
    if Want.count > 0
      x = (Show.total_ticket_count.to_f/Show.total_wants_count.to_f).to_f.round_to(2)
    else
      'NA'
    end
  end
  
  def to_param
    show_date.strftime("%Y-%m-%d")
  end

  named_scope :chrono, :order => 'show_date'
  
  memoize :total_posts, :ticket_count, :wants_count, :rides_count, :friendly_name
end

