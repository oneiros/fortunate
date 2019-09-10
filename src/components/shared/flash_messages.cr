require "./font_awesome"

class Shared::FlashMessages < BaseComponent
  include FontAwesome

  needs flash : Lucky::FlashStore

  def render
    @flash.each do |flash_type, flash_message|
      div class: "alert alert-#{flash_class(flash_type)} alert-dismissible fade show", flow_id: "flash" do
        flash_icon_for(flash_type)
        text " "
        text flash_message
        button type: "button", class: "close", data_dismiss: "alert", aria_label: "Close" do
          span aria_hidden: "true" do
            raw "&times;"
          end
        end
      end
    end
  end

  private def flash_class(flash_type : String) : String
    case flash_type
    when "failure"
      "danger"
    else
      flash_type
    end
  end

  private def flash_icon_for(flash_type : String)
    icon_name = case flash_type
                when "success"
                  "check-circle"
                when "failure"
                  "exclamation-triangle"
                when "info"
                  "info-circle"
                else
                  "question-circle"
                end
    icon icon_name
  end
end
