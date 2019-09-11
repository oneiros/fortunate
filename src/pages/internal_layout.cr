abstract class InternalLayout
  include Lucky::HTMLPage
  include Shared::FontAwesome

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

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
          nav class: "navbar navbar-expand-lg navbar-light bg-light" do
            link Fortunate.settings.site_name, to: Home::Index, class: "navbar-brand"
            button class: "navbar-toggler", type: "button", data_toggle: "collapse", data_target: "#navbarsExampleDefault", aria_controls: "navbarsExampleDefault", aria_expanded: "false", aria_label: "Toggle navigation" do
              span class: "navbar-toggler-icon"
            end
            div class: "collapse navbar-collapse", id: "navbarsExampleDefault" do
              ul class: "navbar-nav mr-auto" do
                li class: "nav-item" do
                  link "Posts", to: Authors::Posts::Index, class: "nav-link"
                end
              end
              span class: "navbar-text" do
                render_signed_in_user
              end
            end
          end
          mount Shared::FlashMessages.new(@context.flash)

          content
        end
      end
    end
  end

  private def render_signed_in_user
    link @current_user.email, to: Me::Show
    text " - "
    link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button"
  end
end
