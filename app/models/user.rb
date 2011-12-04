class User < ActiveRecord::Base

  has_many :items
  has_many :biddings
  has_many :notifications

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



attr_accessible :title, :purpose, :email, :password, :first_name, :middle_name, :last_name, :street, :city, :state,
                  :country, :zipcode, :username, :r_password, :secret_q, :secret_a,
                  :password_confirmation, :remember_me, :dateofbirth, :phonenumber, :status, :cardno, :typecard,
                  :expirydate, :ccv, :email_confirmation

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates_presence_of :cardno, :typecard, :expirydate, :ccv, :if => :is_purpose?
  validates_presence_of :title, :purpose, :first_name, :last_name, :middle_name,  :street, :city, :state,
                        :country, :zipcode, :dateofbirth, :phonenumber, :username,
                        :secret_q, :secret_a

  validates_uniqueness_of  :username

  validates :password, :length => 8..20
  validates_numericality_of :zipcode, :phonenumber
  validates_confirmation_of :password
  validates_confirmation_of :email


  def is_purpose?
    purpose == "Posting"
  end
end
