class Authors::Posts::EditPage < InternalLayout
  needs post : Post
  needs update_operation : UpdatePost

  def content
    div class: "row" do
      div class: "col" do
        h1 "Edit Post"
      end
    end

    render_form(@update_operation)
  end

  private def render_form(operation)
    form_for Update.with(@post) do
      mount Shared::Field.new(operation.title), &.text_input
      mount Shared::Field.new(operation.slug), &.text_input
      mount Shared::Field.new(operation.body) do |field|
        field.textarea rows: 10
      end

      button type: "submit", class: "btn btn-primary", flow_id: "save-post-button" do
        icon "check"
        text " Save Post"
      end
    end
  end
end
