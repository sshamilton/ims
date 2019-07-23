class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  belongs_to :profile
  has_many :handReceipt
  has_many :userHasRole
  has_many :roles, :through => :userHasRole

  def role?(role)
    return !!self.roles.find_by_roleName(role)
  end

  def name
    email
  end


end


