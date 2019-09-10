class UnpublishPost < Post::SaveOperation
  before_save do
    published_at.value = nil
  end
end
