class Authors::Posts::New < BrowserAction
  route do
    operation = CreatePost.new(current_user: current_user)

    render NewPage, operation: operation
  end
end
