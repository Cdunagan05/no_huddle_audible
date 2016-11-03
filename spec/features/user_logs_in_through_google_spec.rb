require 'rails_helper'

RSpec.describe "When a user clicks log in" do
  scenario "They get logged in through google" do
    pending
    stub_omniauth

    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Dunagan")
    expect(page).to have_link("Sign out")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    #Fill in this info with google.com oauth info.
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      provider: "google",
      uid: "cdun",
      info: {
        email: "cdunagan@utexas.edu",
        first_name: "Steven",
        last_name: "Dunagan"
      },
      credentials: {
        token: "84f0jkk320e3",
        refresh_token: "jrs893rh4h4",
        expires_at: DateTime.now,
      }
      })
  end
end
