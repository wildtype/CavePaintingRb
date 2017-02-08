describe "home/index.html.slim" do
  let(:posts) { create_list :post, 5 }

  it "display last 5 articles" do
    assign :posts, posts
    render

    expect(rendered).to have_content posts.first.title
    expect(rendered).to have_content posts.fifth.title
  end
end
