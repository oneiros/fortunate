class Users::Posts::ShowPage < MainLayout
  needs user : User
  needs post : Post

  def page_title
    "#{@post.title} - #{super}"
  end

  def content
    nav class: "post-breadcrumb", aria_label: "breadcrumb" do
      ol class: "breadcrumb" do
        li class: "breadcrumb-item" do
          link "Home", to: Home::Index
        end
        li class: "breadcrumb-item" do
          link @user.name, Users::Show.with(handle: @user.handle)
        end
        li class: "breadcrumb-item active", aria_current: "page" do
          text @post.title
        end
      end
    end

    div class: "text-right text-muted meta-info" do
      para do
        text "posted "
        text @post.published_at.not_nil!.to_s("%B %-d, %Y")
        text " by "
        link @user.name, Users::Show.with(handle: @user.handle)
      end
    end

    div class: "post-body" do
      raw Markd.to_html(@post.body)
    end
  end
end
