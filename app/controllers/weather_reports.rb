# get new weather report form
get '/weather_reports/new' do
  erb :'weather_reports/new'
end

# post new weather report
post '/weather_reports' do
  # p params
  # p "*" * 50 
  # p params[:location]
  # p "*" * 50
  @current_location = params[:location]
  @zip = @current_location.to_zip.first
  # p @zip 
  @latlon = @zip.to_latlon
  # convert latlon string into two floats
  arr = @latlon.split(",")
  lat = arr.first.to_f 
  lon = arr.last.to_f
  # p @latlons
  @weather = ForecastIO.forecast(lat, lon)
  @report = @weather.currently.icon
  # trying to get description from weather api helper
  @description = clothes[@report]
  erb :'weather_reports/show'
end


