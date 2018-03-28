ForecastIO.configure do |c|
  c.api_key = Rails.application.secrets.darksky_apikey
end
