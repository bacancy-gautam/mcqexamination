class User < ApplicationRecord
  attr_writer :login

  rolify


  # before_action :authenticate_user_state, if: :user.
  # devise :database_authenticatable, :authentication_keys => [:enrollment], if: :checkme?
  def login
    @login || self.email || self.enrollment
  end



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

         
  # devise :database_authenticatable, :authentication_keys => [:email], if: :user.has_role?(:faculty)


  has_many :results
  has_many :exams
  has_many :assigns
  has_one :useran
  belongs_to :branch ,optional: true
  belongs_to :semester ,optional: true

def self.find_for_database_authentication warden_conditions
  conditions = warden_conditions.dup
  login = conditions.delete(:login)
  where(conditions).where(["enrollment = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
end


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end

  after_create do
    puts "=========================after create"
  end

  after_commit do
    puts "=========================after commit"
  end
  # validates :enrollment, presence: true

  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  # validates_confirmation_of :password, message: "Should match"
  # validates_presence_of :password_confirmation, if: :password_changed?

end
