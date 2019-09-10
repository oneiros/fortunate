class Authors::Posts::Create < BrowserAction
  route do
    CreatePost.create(params, current_user: current_user) do |operation, post|
      if post
        flash.success = "Post was successfully created as draft."
        redirect to: Index
      else
        render NewPage, operation: operation
      end
    end
  end
end
