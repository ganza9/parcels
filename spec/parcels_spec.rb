require('rspec')
require('parcels')

describe('Parcel') do
  describe("#volume") do
    it("returns the volume based on height width and length") do
    test_volume = Parcel.new(3,4,5, 6)
    expect(test_volume.volume()).to(eq(60))
    end
  end
end
