class DarkSkyService

  def get_forecast(location)
    get_json("/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{location}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
