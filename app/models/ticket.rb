class Ticket < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :show

  validates_inclusion_of :quantity, :in => 1..8
end
