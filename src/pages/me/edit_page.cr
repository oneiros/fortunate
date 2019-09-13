class Me::EditPage < InternalLayout
  needs user : User
  needs update_operation : UpdateUser

  def content
    div class: "row" do
      div class: "col" do
        h1 "Edit Account"
      end
    end

    render_form(@update_operation)
  end

  private def render_form(operation)
    form_for Update do
      mount Shared::Field.new(operation.email), &.text_input
      mount Shared::Field.new(operation.full_name), &.text_input
      mount Shared::Field.new(operation.handle), &.text_input
      mount Shared::Field.new(operation.password), &.password_input
      mount Shared::Field.new(operation.password_confirmation), &.password_input

      button type: "submit", class: "btn btn-primary", flow_id: "save-post-button" do
        icon "check"
        text " Save"
      end
    end
  end
end
