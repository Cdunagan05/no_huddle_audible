class SportsFeedService

  def self.schedule(season)
    response = conn.get "/feed/pull/nfl/#{season}/full_game_schedule.json"
    byebug
    JSON.parse(response.body)
  end

  def self.conn
    Faraday.new(:url => 'https://www.mysportsfeeds.com/api') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
