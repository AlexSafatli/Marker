class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:username]
  has_many :roles
  has_many :courses, :through => :roles
  validates :username, presence: true, uniqueness: { :case_sensitive => false }
end
