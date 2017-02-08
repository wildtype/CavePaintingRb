require "spec_helper"

describe Post do
  context "model attributes" do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:body_textile) }
    it { is_expected.to have_db_column(:body_html) }
    it { is_expected.to have_db_column(:slug) }
  end

  context "validation" do
    it{ is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body_textile) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  context "slug value" do
    it "will set slug from title" do
      post = create :post, title: "Maudy Ayunda"
      expect(post.slug).to eq "maudy_ayunda"
    end

    it "won't set slug if not empty" do
      post = create :post, title: "Maudy Ayunda", slug: "maudy"
      expect(post.slug).to eq "maudy"
    end
  end
end
