class UpdateUser < User::SaveOperation
  permit_columns email, full_name, handle
  attribute password : String
  attribute password_confirmation : String

  before_save do
    validate_uniqueness_of email
    validate_uniqueness_of full_name
    validate_uniqueness_of handle
    password.value.try do |new_password|
      validate_confirmation_of password, with: password_confirmation
      validate_size_of password, min: 6
      Authentic.copy_and_encrypt password, to: encrypted_password
    end
  end
end
