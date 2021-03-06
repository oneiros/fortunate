class Users::Feed::Index < FeedAction
  @user : User?

  get "/:handle/feed" do
    @user = UserQuery.new.handle.eq(handle).first
    user = @user.not_nil!
    posts = PostQuery.new.preload_user.by(user).published.latest_first

    render_rss(posts)
  end

  private def link : String
    user = @user
    if user
      Users::Feed::Index.with(handle: user.handle).url
    else
      ""
    end
  end

  private def title : String
    "Posts by #{@user.try(&.name)}"
  end

  private def description : String
    "A fortunate blog."
  end
end
