class AddTitleToPosts::V20190823133743 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Post) do
      add title : String, fill_existing_with: :nothing
    end
  end

  def rollback
    alter table_for(Post) do
      remove :title
    end
  end
end
