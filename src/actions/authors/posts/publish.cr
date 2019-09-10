class Authors::Posts::Publish < BrowserAction
  put "/authors/posts/:post_id/publish" do
    post = PostQuery.new.by(current_user).find(post_id)

    PublishPost.update(post) do |operation, post|
      if operation.saved?
        flash.success = "Post was successfully published."
        redirect to: Index
      else
        flash.failure = "Something went wrong."
        redirect to: Index
      end
    end
  end
end
