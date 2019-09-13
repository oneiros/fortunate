class PasswordResetRequests::NewPage < AuthLayout
  needs operation : RequestPasswordReset

  def content
    div class: "card login-form" do
      h3 "Reset your password", class: "card-header"
      div class: "card-body" do
        render_form(@operation)
      end
    end
  end

  private def render_form(op)
    form_for PasswordResetRequests::Create do
      mount Shared::Field.new(op.email), &.email_input
      submit "Reset Password", class: "btn btn-primary", flow_id: "request-password-reset-button"
    end
  end
end
