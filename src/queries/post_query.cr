class PostQuery < Post::BaseQuery
  def published
    published_at.is_not_nil
  end

  def draft
    published_at.is_nil
  end

  def latest_first
    published_at.desc_order
  end

  def by(user : User)
    user_id.eq(user.id)
  end
end
