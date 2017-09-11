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
  @height = params.fetch("height").to_i
  @width = params.fetch("width").to_i
  @length = params.fetch("length").to_i
  @weight = params.fetch("weight").to_i
  @shipping = params.fetch("shipping")
  parcel = Parcel.new(@height, @width, @length, @weight, @shipping)
  @volume = parcel.volume
  @shipping_cost = parcel.cost_to_ship
  if parcel.volume <= 216
    @string_to_display = "Less than .25 sq. ft"
  elsif parcel.volume >= 1728
    @string_to_display = "Greater than 1 sq. ft"
  elsif parcel.volume >= 46656
    @string_to_display = "Greater than 3 sq. ft"
  end
  erb(:output)
end
