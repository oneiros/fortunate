class Authors::Posts::Unpublish < BrowserAction
  put "/authors/posts/:post_id/unpublish" do
    post = PostQuery.new.by(current_user).find(post_id)

    UnpublishPost.update(post) do |operation, post|
      if operation.saved?
        flash.success = "Post is not longer published."
        redirect to: Index
      else
        flash.failure = "Something went wrong."
        redirect to: Index
      end
    end
  end
end
