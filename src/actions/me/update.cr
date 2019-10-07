class Me::Update < BrowserAction
  put "/me" do
    UpdateUser.update(current_user, params) do |operation, user|
      if operation.saved?
        flash.success = "Account was updated successfully."
        redirect to: Authors::Posts::Index
      else
        html EditPage, user: user, update_operation: operation
      end
    end
  end
end
