class PublishPost < Post::SaveOperation
  before_save do
    published_at.value = Time.new
  end
end
