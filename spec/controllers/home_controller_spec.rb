require "spec_helper"

describe HomeController do
  describe "GET /index" do
    let!(:posts) do
      (1..6).to_a.map do |n|
        create :post, created_at: n.hours.ago
      end
    end

    let(:selected_posts) { assigns :posts }

    before do
      get :index
    end

    it { is_expected.to respond_with :ok }

    it "assigns 5 latest post" do
      expect(selected_posts).to be_present
      expect(selected_posts.size).to eq 5
      expect(selected_posts.first).to eq posts.first
    end
  end
end
