class Listing < ActiveRecord::Base
  attr_accessible :contact, :location, :latitude, :longitude, :owner, :rent, :title, :created_at, :id, :updated_at, :state , :country 
  geocoded_by :location
  after_validation :geocode 
end
