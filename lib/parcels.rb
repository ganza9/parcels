require('pry')
class Parcel
  def initialize(height, width, length, weight, shipping)
    @height = height.to_i
    @width = width.to_i
    @length = length.to_i
    @weight = weight.to_i
    @volume = 0
    @shipping = shipping
    @shipping_cost = 0
  end

  def volume
    @volume = @height * @width * @length
  end

  def cost_to_ship
    if @shipping == "Next Day Shipping - $15"
      @shipping_cost = 15
    elsif @shipping == "Two Day Shipping - $10"
      @shipping_cost = 10
    else
      @shipping_cost = 5
    end
  end
end
