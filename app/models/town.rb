class Town < ActiveRecord::Base
  before_validation :load_position
  validates :latitude, :long, presence: true
  
  private
  def load_position
    places = Nominatim.search(name).limit(1).first
    if places
      self.latitude = places.lat
      self.long = places.lon
    end
  end
end