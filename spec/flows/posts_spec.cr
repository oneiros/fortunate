require "../spec_helper"

describe "Posting flow" do
  it "allows creating a new post" do
    user = UserBox.create
    flow = BaseFlow.new

    flow.visit Authors::Posts::Index, as: user
    flow.click "@new-post-button"

    flow.el(".CodeMirror").click
    flow.el(".CodeMirror textarea").append <<-MD
      # TestPost

      Nothing to see here
    MD
    flow.click "@create-post-button"
    flow.el("table.drafts tbody tr td", text: "TestPost").should be_on_page

    flow.visit Home::Index
    flow.el("h2 a", text: "TestPost").should_not be_on_page
  end

  it "allows publishing a post" do
    post = PostBox.create &.title("TestPost")
    user = UserQuery.new.id.eq(post.user_id).first
    flow = BaseFlow.new

    flow.visit Authors::Posts::Index, as: user
    flow.click "@publish-post-#{post.id}"

    flow.el("table.drafts tbody tr td", text: "TestPost").should_not be_on_page
    flow.el("table.posts tbody tr td", text: "TestPost").should be_on_page

    flow.visit Home::Index
    flow.el("h2 a", text: "TestPost").should be_on_page
  end
end
