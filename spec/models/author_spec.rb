require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      author = build(:author)
      expect(author).to be_valid
    end

    it "is invalid without a name" do
      author = build(:author, name: nil)
      expect(author).not_to be_valid
      expect(author.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      author = build(:author, description: nil)
      expect(author).not_to be_valid
      expect(author.errors[:description]).to include("can't be blank")
    end
  end

  describe "Associations" do
    it { should have_many(:articles) }
  end
end
