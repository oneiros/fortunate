require "./main_layout"

abstract class FeedLayout < MainLayout
  include Shared::FontAwesome

  needs posts : PostQuery

  private def render_posts
    @posts.each do |post|
      h2 class: "post-title" do
        link post.title, to: Users::Posts::Show.with(handle: post.user.handle, slug: post.slug)
      end
      para class: "post-metadata" do
        text "posted "
        text post.published_at.not_nil!.to_s("%B %-d, %Y")
        text " by "
        link post.user.name, Users::Show.with(handle: post.user.handle)
      end
      para class: "post-excerpt" do
        raw post.excerpt
        raw "&hellip; "
        link "Read more", to: Users::Posts::Show.with(handle: post.user.handle, slug: post.slug)
      end
    end
  end

  private def header
    mount Shared::FeedHead.new(page_title: page_title, context: @context, feed_url: feed_url)
  end

  private abstract def feed_url : String
end
