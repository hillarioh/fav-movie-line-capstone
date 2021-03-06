require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(User.create).to_not be_valid
    end

    it 'is not valid without a username' do
      expect(User.new(username: nil)).to_not be_valid
    end

    it 'is not valid without a fullname' do
      expect(User.new(fullname: nil)).to_not be_valid
    end

    it 'is not valid without a profile pic' do
      expect(User.new(profile_pic: nil)).to_not be_valid
    end

    it 'is not valid without a cover pic' do
      expect(User.new(cover_pic: nil)).to_not be_valid
    end
  end
end
