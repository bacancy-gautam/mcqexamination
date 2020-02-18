class User < ApplicationRecord
 
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :results
  has_many :exams
  has_many :assigns
  has_one :useran
  belongs_to :branch


  after_create do
    puts "=========================after create"
  end

  after_commit do
    puts "=========================after commit"
  end
  # validates :enrollment, presence: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  # validates_confirmation_of :password, message: "Should match"
  # validates_presence_of :password_confirmation, if: :password_changed?

end
