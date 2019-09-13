abstract class AuthLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    Fortunate.settings.site_name
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead.new(page_title: page_title, context: @context)

      body do
        main class: "container" do
          div class: "row" do
            div class: "col-sm" do
            end
            div class: "col-sm" do
              mount Shared::FlashMessages.new(@context.flash)
              content
            end
            div class: "col-sm" do
            end
          end
        end
      end
    end
  end
end
