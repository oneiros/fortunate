class Authors::Posts::Update < BrowserAction
  route do
    post = PostQuery.new.by(current_user).find(post_id)

    UpdatePost.update(post, params) do |operation, post|
      if operation.saved?
        flash.success = "Post was updated successfully."
        redirect to: Index
      else
        render EditPage, post: post, update_operation: operation
      end
    end
  end
end
