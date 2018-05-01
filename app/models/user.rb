class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :first_name, :last_name, :email, :password_confirmation, :presence => true
  validates :password, :length => { :minimum => 8 }
  before_save :downcase_email

   def downcase_email
      self.email.downcase!
   end


  

  def self.authenticate_with_credentials(user, password)
    user = User.find_by_email(user.strip.downcase)
    if !user || !password
      return nil
    else
      user.authenticate(password)
    end
    

  end

end