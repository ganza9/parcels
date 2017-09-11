require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/parcels')

get('/')do
  @description = "This application will determine the volume of your parcel and shipping costs"
  erb(:input)
end
get('/output') do
  @height = params.fetch("height")
  @width = params.fetch("width")
  @length = params.fetch("length")
  parcel = Parcel.new(@height, @width, @length)
  parcel.volume
  binding.pry
  if @volume < 216
    @string_to_display = "less than .25 sq. ft"
  elsif @volume >= 1728
    @string_to_display = "Greater than 1 sq. ft"
  elsif @volume >= 46656
    @string_to_display = "Greater than 3 sq. ft"
  end
end
