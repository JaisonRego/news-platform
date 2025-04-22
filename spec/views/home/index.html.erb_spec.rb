require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  before do
    assign(:platform_name, "News Platform")
    render
  end

  it "displays the welcome message" do
    expect(rendered).to include("Welcome to News Platform")
  end

  it "includes a link to explore articles" do
    expect(rendered).to have_link("Explore Articles", href: "/api/v1/articles")
  end

  it "includes a link to categories" do
    expect(rendered).to have_link("Categories", href: "/api/v1/categories")
  end

  it "includes a link to authors" do
    expect(rendered).to have_link("Authors", href: "/api/v1/authors/1")
  end

  it "includes a sign-out button" do
    expect(rendered).to have_selector("a.btn.btn-outline-danger", text: "Sign Out")
  end
end
