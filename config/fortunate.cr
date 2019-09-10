Fortunate.configure do |settings|
  settings.site_name = ENV["FORTUNATE_SITE_NAME"]? || "My Blog"
end
