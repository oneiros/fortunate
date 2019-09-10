class Authors::Posts::NewPage < InternalLayout
  needs operation : CreatePost

  def content
    div class: "row" do
      div class: "col" do
        h1 "New Post"
      end
    end

    render_form(@operation)
  end

  private def render_form(operation)
    form_for Create do
      mount Shared::Field.new(operation.body) do |field|
        field.textarea rows: 20
      end

      button type: "submit", class: "btn btn-primary", flow_id: "save-post-button" do
        icon "check"
        text " Save Post"
      end
    end
  end
end
