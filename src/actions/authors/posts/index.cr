class Authors::Posts::Index < BrowserAction
  route do
    drafts = PostQuery.new.by(current_user).draft
    posts = PostQuery.new.by(current_user).published.latest_first

    render IndexPage, drafts: drafts, posts: posts
  end
end
