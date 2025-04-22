require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      article = create(:article)
      expect(article).to be_valid
    end


    it "is invalid without a title" do
      article = build(:article, title: nil)
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it "is invalid without an article_type" do
      article = build(:article, article_type: nil)
      expect(article).not_to be_valid
      expect(article.errors[:article_type]).to include("can't be blank")
    end

    it "is invalid without a category" do
      article = build(:article, category: nil)
      expect(article).not_to be_valid
      expect(article.errors[:category]).to include("must exist")
    end

    it "is invalid without an author" do
      article = build(:article, author: nil)
      expect(article).not_to be_valid
      expect(article.errors[:author]).to include("must exist")
    end

    it "is invalid without a publish_date" do
      article = build(:article, publish_date: nil)
      expect(article).not_to be_valid
      expect(article.errors[:publish_date]).to include("can't be blank")
    end
  end

  describe "Associations" do
    it { should belong_to(:category) }
    it { should belong_to(:author) }
    it { should have_and_belong_to_many(:tags) }
    it { should have_one_attached(:article_image) }
  end

  describe "Enums" do
    it "defines article types as text, audio, and video" do
      expect(Article.article_types.keys).to contain_exactly("text", "audio", "video")
    end
  end

  describe "Scopes" do
    describe ".recent" do
      it "returns articles published within the last N days" do
        recent_article = create(:article, publish_date: 2.days.ago)
        old_article = create(:article, publish_date: 10.days.ago)

        expect(Article.recent(7)).to include(recent_article)
        expect(Article.recent(7)).not_to include(old_article)
      end
    end
  end

  describe "#formatted_publish_date" do
    it "returns the publish date in a readable format" do
      article = create(:article, publish_date: Date.new(2025, 4, 22))
      expect(article.formatted_publish_date).to eq("April 22, 2025")
    end
  end
end
