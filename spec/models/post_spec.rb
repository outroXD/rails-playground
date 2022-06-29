require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'test' do
    let(:post) { FactoryBot.create(:post) }

    it 'test' do
      expect(post).to be_valid
      p "STOP"
    end
  end
end
