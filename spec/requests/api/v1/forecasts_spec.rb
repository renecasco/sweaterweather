require 'rails_helper'
describe "Forecast API" do
  it "sends forecast data for a city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
