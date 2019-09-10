class Authors::Posts::Edit < BrowserAction
  route do
    post = PostQuery.new.by(current_user).find(post_id)
    update_operation = UpdatePost.new(post)

    render EditPage, post: post, update_operation: update_operation
  end
end
