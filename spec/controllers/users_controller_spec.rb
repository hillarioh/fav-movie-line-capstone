require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Users controller', type: :feature do
  before :each do
    l = User.new(username: 'example', fullname: 'example')
    l.save
    m = User.new(username:'niiazaly',fullname: 'niiazaly')
    m.save
    d = User.new(username: 'okerioh', fullname: 'okerioh')
    d.save
    f = Following.new(followed: l, follower: m)
    f.save
    visit '/users/new'
    within('form') do
      fill_in 'user[username]', with: 'niiazaly'
      fill_in 'user[fullname]', with: 'niiazaly'
    end
    click_button "Create account"
  end
  it 'shows all lines posted' do
    visit '/lines'
    expect(page).to have_content ' '
  end
  it 'show list of users' do
    visit '/users'
    expect(page).to have_content ' '
  end
end