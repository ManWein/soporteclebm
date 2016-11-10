class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sign_in_path
  	"perro"
  end

  def manager?
    self.class == Manager
  end

  def analyst?
    self.class == Analyst
  end
  
  def applicant?
    self.class == Applicant
  end

end


