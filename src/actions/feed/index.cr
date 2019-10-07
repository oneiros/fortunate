class Feed::Index < FeedAction
  get "/feed" do
    posts = PostQuery.new.preload_user.published.latest_first

    render_rss(posts)
  end

  private def link : String
    Home::Index.url
  end

  private def title : String
    Fortunate.settings.site_name
  end

  private def description : String
    "A fortunate blog."
  end
end
