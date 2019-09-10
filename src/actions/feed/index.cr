class Feed::Index < FeedAction
  get "/feed" do
    posts = PostQuery.new.preload_user.published.latest_first

    render_rss(posts)
  end

  private def link
    Home::Index.url
  end

  private def title
    Fortunate.settings.site_name
  end

  private def description
    "A fortunate blog."
  end
end
