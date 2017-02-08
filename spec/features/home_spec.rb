require "spec_helper"

describe "Homepage" do
  it "display list of the last 5 articles" do
    articles = create_list :post, 5
    visit root_path

    articles.each do |article|
      expect(page).to have_content article.title
    end
  end
end
