require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      category = build(:category)
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      category = build(:category, name: nil)
      expect(category).not_to be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end
  end

  describe "Associations" do
    it { should have_many(:articles) }
  end
end
