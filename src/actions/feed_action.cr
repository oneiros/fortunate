abstract class FeedAction < Lucky::Action
  private abstract def link : String
  private abstract def title : String
  private abstract def description : String

  private def render_rss(posts : PostQuery)
    channel = RSS::Channel.new( link: link, title: title, description: description)
    if first_post = posts.first
      channel.last_build_date = first_post.published_at
    end
    posts.each do |post|
      item = RSS::Item.new(title: post.title)
      uri = URI.parse(
        Users::Posts::Show.with(handle: post.user.handle, slug: post.slug).url
      )
      item.link = uri
      item.guid = uri
      item.pub_date = post.published_at
      channel << item
    end

    send_text_response(channel.to_s, "application/rss+xml", 200)
  end
end
