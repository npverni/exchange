class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
end