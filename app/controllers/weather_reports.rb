get '/weather_reports/new' do
  erb :'weather_reports/new'
end

post '/weather_reports' do
  @current_location = params[:location]
  @zip = @current_location.to_zip.first
  @latlon = @zip.to_latlon
  arr = @latlon.split(",")
  lat = arr.first.to_f 
  lon = arr.last.to_f
  @weather = ForecastIO.forecast(lat, lon)
  @report = @weather.currently.icon
  @description = clothes[@report]
  erb :'weather_reports/show'
end


