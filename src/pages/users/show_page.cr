class Users::ShowPage < FeedLayout
  needs user : User

  def content
    nav class: "post-breadcrumb", aria_label: "breadcrumb" do
      ol class: "breadcrumb" do
        li class: "breadcrumb-item" do
          link "Home", to: Home::Index
        end
        li class: "breadcrumb-item active", aria_current: "page" do
          text @user.name
        end
      end
    end

    h1 class: "site-name" do
      text "Posts by #{@user.name}"
      link to: Feed::Index.with(handle: @user.handle), class: "rss-link", data_turbolinks: false do
        icon "rss"
      end
    end

    render_posts
  end

  private def feed_url : String
    Feed::Index.with(handle: @user.handle).url
  end
end
