module Shared::FontAwesome
  def icon(name : String, style : String = "fas", additional_classes : String = "")
    i class: "#{style} fa-#{name} #{additional_classes}"
  end
end
