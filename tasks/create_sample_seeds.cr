require "../spec/support/boxes/**"

# Add sample data helpful for development, e.g. (fake users, blog posts, etc.)
#
# Use `Db::CreateRequiredSeeds` if you need to create data *required* for your
# app to work.
class Db::CreateSampleSeeds < LuckyCli::Task
  summary "Add sample database records helpful for development"

  def call
    unless UserQuery.new.email("admin@example.com").first?
      user = UserBox.create do |admin|
        admin.email("admin@example.com")
        admin.handle("admin")
      end

      one_day = Time::Span.new(days: 1, hours: 0, minutes: 0, seconds: 0)
      now = Time.local
      two_days_ago = now - one_day - one_day
      PostBox.create do |post|
        post.title("First Post")
        post.slug("first-post")
        post.body("# First Post\n\nWelcome")
        post.user_id(user.id)
        post.published_at(two_days_ago)
      end

      one_day_ago = now - one_day
      PostBox.create do |post|
        post.title("Very important title")
        post.slug("very-important-title")
        post.body("# Very important title\n\nThis is my second post")
        post.user_id(user.id)
        post.published_at(one_day_ago)
      end

      PostBox.create do |post|
        post.title("Unfinished")
        post.slug("unfinished")
        post.body("# Unfinished\n\nThis is still only a draft")
        post.user_id(user.id)
      end
    end
    puts "Done adding sample data"
  end
end
