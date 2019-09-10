class CreatePost < Post::SaveOperation
  permit_columns body
  needs current_user : User

  before_save do
    validate_required body
    extract_title
    create_slug
    user_id.value = current_user.id
  end

  private def extract_title
    return if body.value.blank?
    text = body.value.not_nil!
    text.each_line do |line|
      unless line.blank?
        title.value = line.sub(/^\s*#*/, "").strip
        return
      end
    end
  end

  private def create_slug
    return if title.value.blank?
    title_text = title.value.not_nil!
    candidate = URI.encode(title_text.strip.downcase.gsub(/\s+/, "-"))
    while PostQuery.new.user_id(current_user.id).slug(candidate).any?
      if match_data = candidate.match /\-(\d+)$/
        index = match_data[1].to_i
        candidate = candidate.sub(/\-\d+$/, "-#{index + 1}")
      else
        candidate = "#{candidate}-1"
      end
    end
    slug.value = candidate
  end
end
