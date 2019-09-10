class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
    column handle : String
    column full_name : String?
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def name : String
    if full_name
      full_name.not_nil!
    else
      handle
    end
  end
end
