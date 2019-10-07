class Users::Show < BrowserAction
  include Auth::AllowGuests

  get "/user/:handle" do
    user = UserQuery.new.handle.eq(handle).first
    posts = PostQuery.new.preload_user.by(user).published.latest_first

    html ShowPage, user: user, posts: posts
  end
end
