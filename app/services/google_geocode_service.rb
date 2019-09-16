class GoogleGeocodeService

  def get_coordinates(location)

    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_MAPS_API_KEY"]
      faraday.params["address"] = location
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/maps/api/geocode/json?")

    location_data = JSON.parse(response.body, symbolize_names: true)[:results]

    location_data[0][:geometry][:location].values.join(",")

  end

end
