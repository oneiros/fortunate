class AddUserHandleAndName::V20190821130307 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add handle : String, fill_existing_with: :nothing
      add full_name : String?
    end
  end

  def rollback
    alter table_for(User) do
      remove :handle
      remove :full_name
    end
  end
end
