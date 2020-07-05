require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(Following.create).to_not be_valid
    end

    it 'is not valid without a username' do
      expect(Following.new(followed: nil)).to_not be_valid
    end

    it 'is not valid without a fullname' do
      expect(Following.new(follower: nil)).to_not be_valid
    end
  end
end
