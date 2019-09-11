class Authors::Posts::IndexPage < InternalLayout
  needs drafts : PostQuery
  needs posts : PostQuery

  def content
    div class: "row" do
      div class: "col" do
        div class: "float-left" do
          h1 "Posts"
        end
        div class: "float-right" do
          link to: New, class: "btn btn-primary", flow_id: "new-post-button" do
            icon "feather-alt"
            text " New Post"
          end
        end
      end
    end

    if @drafts.any?
      h2 "Drafts"

      posts_table(@drafts, name: "drafts")
    end
    if @posts.any?
      h2 "Published Posts"

      posts_table(@posts)
    end
  end

  private def posts_table(posts, name = "posts")
    table class: "table #{name}" do
      tbody do
        posts.each do |post|
          tr do
            td do
              text post.title
            end
            td do
              div class: "btn-group" do
                link to: Edit.with(post), class: "btn btn-sm btn-primary" do
                  icon "edit"
                  text " Edit"
                end
                if post.draft?
                  link to: Publish.with(post), class: "btn btn-sm btn-success", flow_id: "publish-post-#{post.id}" do
                    icon "paper-plane"
                    text " Publish"
                  end
                else
                  link to: Unpublish.with(post), class: "btn btn-sm btn-warning" do
                    icon "ban"
                    text " Unpublish"
                  end
                end
                link to: Delete.with(post), class: "btn btn-sm btn-danger", data_confirm: "Are you sure?" do
                  icon "trash"
                  text " Delete"
                end
              end
            end
          end
        end
      end
    end
  end
end
