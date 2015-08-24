class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  validates :login, presence: true, allow_blank: false, uniqueness: true
  validates_format_of :login,
    { with: /[a-zA-Z0-9]+/, message: "can only contain letters and numbers" }
  validates_format_of :login,
    { with: /[a-zA-Z].*/, message: "must begin with a letter" }
  validates :raw_password, presence: true, allow_blank: false, length: {minimum: 6}
  validates_format_of :raw_password,
    { with: /[a-zA-Z0-9]+/, message: "can only contain letters and numbers" }
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  # Need to find out if using @raw_password for validation
  # is a security problem.  How long does @raw_password exist?
  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def raw_password
    @raw_password
  end
end
