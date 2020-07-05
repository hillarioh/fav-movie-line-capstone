require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Sessions controller', type: :feature do
  before :each do
    m = User.new(username:'niiazaly',fullname: 'niiazaly')
    m.save
    d = User.new(username: 'okerioh', fullname: 'okerioh')
    d.save
    visit '/login'
    within('form') do
      fill_in 'username', with: 'okerioh'
    end
    click_button "Log In"
  end
  it 'shows all lines posted' do
    visit '/lines'
    expect(page).to have_content ' '
  end
end