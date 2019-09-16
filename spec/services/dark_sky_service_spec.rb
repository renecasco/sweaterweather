require 'rails_helper'

describe "DarkSkyService" do
  context "instance methods" do
    context "#get_coordinates" do
      it 'returns longitude and latitude for a city' do
        # WebMock.allow_net_connect!
        stub_google_geocode_api_call
        stub_dark_sky_api_call
        
        location = GoogleGeocodeService.new("Denver,CO").get_coordinates
        service = DarkSkyService.new
        forecast_data = service.get_forecast(location)

        expect(forecast_data).to have_key(:currently)
	      expect(forecast_data).to have_key(:minutely)
	      expect(forecast_data).to have_key(:hourly)
	      expect(forecast_data).to have_key(:daily)
      end
    end
  end
end
