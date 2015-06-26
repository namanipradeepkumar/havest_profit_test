class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :consultant

  has_many :fields
  has_many :contracts
  has_many :inputs
  has_many :recommendations

  def display_name
    self.name.blank? ? self.email : self.name
  end
end
