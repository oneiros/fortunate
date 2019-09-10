require "./layout_head"

class Shared::FeedHead < Shared::LayoutHead
  needs feed_url : String

  def render
    head do
      base_headers
      tag "link", rel: "alternate", type: "application/rss+xml", title: "Subscribe to RSS feed", href: @feed_url
    end
  end
end
