class Event < ActiveRecord::Base
  attr_accessible :description, :from, :location, :title, :to
end
