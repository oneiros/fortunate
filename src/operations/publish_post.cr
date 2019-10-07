class PublishPost < Post::SaveOperation
  before_save do
    published_at.value = Time.local
  end
end
