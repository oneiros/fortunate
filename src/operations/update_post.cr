class UpdatePost < Post::SaveOperation
  permit_columns title, body, slug

  before_save do
    validate_required body
    validate_required title
    validate_required slug
    validate_uniqueness_of slug
  end
end
