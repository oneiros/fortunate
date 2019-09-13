# This component is used to make it easier to render the same fields styles
# throughout your app
#
# ## Usage
#
#     mount Shared::Field.new(form.name) # Renders text input by default
#     mount Shared::Field.new(form.email), &.email_input(autofocus: "true")
#     mount Shared::Field.new(form.username), &.email_input(placeholder: "Username")
#     mount Shared::Field.new(form.name), &.text_input(append_class: "custom-input-class")
#     mount Shared::Field.new(form.nickname), &.text_input(replace_class: "compact-input")
#
# ## Customization
#
# You can customize this class so that fields render like you expect
# For example, you might wrap it in a div with a "field-wrapper" class.
#
#    div class: "field-wrapper"
#      label_for field
#      yield field
#      mount Shared::FieldErrors.new(field)
#    end
#
# You may also want to have more more classes if you render fields
# differently in different parts of your app, e.g. `Shared::CompactField``
class Shared::Field(T) < BaseComponent
  needs field : Avram::PermittedAttribute(T)

  def render
    div class: "form-group" do
      label_for @field
      field_classes = "form-control"
      field_classes = "#{field_classes} is-invalid" unless @field.valid?

      with_defaults field: @field, class: field_classes do |input_builder|
        yield input_builder
      end

      mount Shared::FieldErrors.new(@field)
    end
  end

  # Use a text_input by default
  def render
    render &.text_input
  end
end
