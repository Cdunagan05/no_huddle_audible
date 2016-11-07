class SportsFeedService

  def self.schedule(season)
    # conn.basic_auth(ENV['USERNAME'], ENV['PASSWORD'])
    response = conn.get("/api/feed/pull/nfl/#{season}/full_game_schedule.json")
    JSON.parse(response.body)
  end

  def self.conn
    Faraday.new(url: 'https://www.mysportsfeeds.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.basic_auth(ENV['USERNAME'], ENV['PASSWORD'])
    end
  end
end
