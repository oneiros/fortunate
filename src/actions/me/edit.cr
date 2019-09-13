class Me::Edit < BrowserAction
  get "/me/edit" do
    operation = UpdateUser.new(current_user)

    render EditPage, user: current_user, update_operation: operation
  end
end
