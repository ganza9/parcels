class Parcel
  def initialize(height, width, length, weight)
    @height = height
    @width = width
    @length = length
    @weight = weight
    @volume = 0
  end

  def volume
    @volume = @height * @width * @length
  end
end
