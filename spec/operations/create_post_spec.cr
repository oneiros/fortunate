require "../spec_helper"

describe CreatePost do
  it "allows creating posts" do
    user = UserBox.create
    body = "# My first post"
    post = CreatePost.create!(body: body, current_user: user)
  end

  it "extracts the title and slug from the body" do
    user = UserBox.create
    body = "# My first post"
    post = CreatePost.create!(body: body, current_user: user)

    post.title.should eq "My first post"
    post.slug.should eq "my-first-post"
  end

  it "adds a number to the slug if it is not unique" do
    user = UserBox.create
    PostBox.create do |post|
      post.user_id user.id
      post.slug("my-first-post")
    end

    body = "# My first post"
    post = CreatePost.create!(body: body, current_user: user)

    post.slug.should eq "my-first-post-1"

    post = CreatePost.create!(body: body, current_user: user)
    post.slug.should eq "my-first-post-2"
  end
end
