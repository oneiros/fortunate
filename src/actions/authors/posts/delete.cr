class Authors::Posts::Delete < BrowserAction
  route do
    post = PostQuery.new.by(current_user).find(post_id)
    post.delete

    flash.success = "Post was deleted successfully."
    redirect to: Index
  end
end
