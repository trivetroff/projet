class Town < ActiveRecord::Base
    validates :name, presence: true
    before_validation :getLocation

  public
  def get_weather
    if self.latitude && self.long
      forecast = ForecastIO.forecast(self.latitude,self.long, params: { units:'si', lang: 'fr' })
      if forecast
        return forecast.currently
      end
    end
    return nil
  end

  private
  def getLocation
    city = Nominatim.search(self.name).limit(1).first
    if city
      self.latitude = city.latitude
      self.long = city.lon
    end
  end

end