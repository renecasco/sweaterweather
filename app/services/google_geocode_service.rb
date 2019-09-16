class GoogleGeocodeService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    location_data = get_json("/maps/api/geocode/json?")
    location_data[0][:geometry][:location].values.join(",")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_MAPS_API_KEY"]
      faraday.params["address"] = @location
      faraday.adapter Faraday.default_adapter
    end
  end

end
