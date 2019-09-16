class DarkSkyService

  def get_forecast(location)
    conn = Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end

end
