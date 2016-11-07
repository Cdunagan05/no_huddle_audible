require 'rails_helper'

RSpec.describe "Sports_Feed_Service" do
  it "I get back schedule data" do
    data = SportsFeedService.schedule("2015-2016-regular")

    expect(data.count).to eq(30)

  end
end
