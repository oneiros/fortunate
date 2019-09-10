class UserBox < Avram::Box
  def initialize
    email sequence("test@example.com")
    encrypted_password Authentic.generate_encrypted_password("password")
    handle "test"
  end
end
