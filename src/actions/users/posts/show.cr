class Users::Posts::Show < BrowserAction
  include Auth::AllowGuests

  get "/user/:handle/post/:slug" do
    user = UserQuery.new.handle.eq(handle).first
    post = PostQuery.new.by(user).slug.eq(slug).first

    render ShowPage, user: user, post: post
  end
end
