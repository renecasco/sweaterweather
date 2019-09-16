require 'rails_helper'

describe "GoogleGeocodeService" do
  context "instance methods" do
    context "#get_coordinates" do
      it 'returns longitude and latitude for a city' do
        # WebMock.allow_net_connect!
        stub_google_geocode_api_call

        service = GoogleGeocodeService.new("Denver,CO")
        coordinates = service.get_coordinates

        expect(coordinates).to eq("39.7392358,-104.990251")
      end
    end
  end
end
