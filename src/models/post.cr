class Post < BaseModel
  table do
    column title : String
    column slug : String
    column body : String
    column published_at : Time?
    belongs_to user : User
  end

  def published?
    !draft
  end

  def draft?
    published_at.nil?
  end
end
