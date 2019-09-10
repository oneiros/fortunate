class CreatePosts::V20190821130239 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Post) do
      primary_key id : Int64
      add slug : String
      add body : String
      add published_at : Time?
      add_belongs_to user : User, on_delete: :cascade
      add_timestamps
    end
    create_index :posts, [:user_id, :slug], unique: true
  end

  def rollback
    drop_index :posts, [:user_id, :slug]
    drop table_for(Post)
  end
end
