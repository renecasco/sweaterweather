require 'rails_helper'

describe GoogleGeocodeService do
  context "instance methods" do
    context "#get_coordinates" do
      it 'returns longitude and latitude for a city' do
        WebMock.allow_net_connect!
        coordinates = subject.get_coordinates("Denver,CO")

        expect(coordinates).to eq("39.7392358,-104.990251")
      end
    end
  end
end
