require "./user_box"

class PostBox < Avram::Box
  def initialize
    title "My Wonderful Post"
    slug "my-wonderful-post"
    body "# My Wonderful Post\n\nThis is a great post!"
    user_id UserBox.create.id
  end
end
