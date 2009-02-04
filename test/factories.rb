require 'faker'
require 'populator'

Factory.sequence :email do |n|
  "person#{n}@phishthoughts.com" 
end

Factory.sequence :login do |n|
  "phish#{n}" 
end


Factory.define :user do |f|
  f.login               {Factory.next :login}
  f.email               {Factory.next :email}
  f.salt                '356a192b7913b04c54574d18c28d46e6395428ab'
  f.crypted_password    '9c400d0627a6bd65e928fd5ba1a32e3c5576aa5e'
  f.created_at          {rand(10).days.ago.to_s(:db)}
end


Factory.define :show do |f|
  f.show_date         {rand(365).days.from_now}
  f.association       :venue
end

Factory.define :venue do |f|
  f.name        {"#{Populator.words(2)} Amphitheater"}
  f.city        {Faker::Address.city}
  f.state       {Faker::Address.us_state_abbr}
end

Factory.define :ticket do |f|
  f.quantity    {rand(4)}
  f.section     {"Section #{rand(300)}"}
  f.needs_ride  true
  f.association :show
  f.association :user, :factory => :user
end

Factory.define :want do |f|
  f.quantity    {rand(4)}
  f.section     {"Section #{rand(300)}"}
  f.needs_ride  true
  f.will_accept_cash true
  f.will_accept_trade true
  f.association :show
  f.association :user, :factory => :user
end