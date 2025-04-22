require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
  end

  describe 'roles' do
    it 'defines user and admin roles' do
      expect(User.roles.keys).to contain_exactly('user', 'admin')
    end

    it 'returns true for admin? if the role is admin' do
      user = User.new(role: 'admin')
      expect(user.admin?).to be true
    end

    it 'returns false for admin? if the role is user' do
      user = User.new(role: 'user')
      expect(user.admin?).to be false
    end
  end
end
