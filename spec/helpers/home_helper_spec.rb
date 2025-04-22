require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe "#format_welcome_message" do
    it "returns a formatted welcome message" do
      expect(helper.format_welcome_message("News Platform")).to eq("Welcome to News Platform!")
    end
  end

  describe "#current_year" do
    it "returns the current year" do
      expect(helper.current_year).to eq(Time.current.year)
    end
  end
end
