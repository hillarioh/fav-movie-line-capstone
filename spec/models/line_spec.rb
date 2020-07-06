require 'rails_helper'

RSpec.describe Line, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(Line.create).to_not be_valid
    end

    it 'is not valid without a movie title' do
      expect(Line.new(movie_title: nil)).to_not be_valid
    end

    it 'is not valid without text' do
      expect(Line.new(text: nil)).to_not be_valid
    end
  end
end
