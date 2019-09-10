class Home::IndexPage < FeedLayout
  def content
    h1 class: "site-name" do
      text Fortunate.settings.site_name
      link to: Feed::Index, class: "rss-link" do
        icon "rss"
      end
    end

    render_posts
  end

  private def feed_url : String
    Feed::Index.url
  end
end
