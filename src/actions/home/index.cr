class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
    posts = PostQuery.new.preload_user.published.latest_first

    render IndexPage, posts: posts
  end
end
