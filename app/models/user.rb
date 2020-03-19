# frozen_string_literal: true

class User < ApplicationRecord
  attr_writer :login

  rolify

  # before_action :authenticate_user_state, if: :user.
  # devise :database_authenticatable, :authentication_keys => [:enrollment], if: :checkme?
  def login
    @login || email || enrollment
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  # devise :database_authenticatable, :authentication_keys => [:email], if: :user.has_role?(:faculty)
  validates :email, format: { with: /[^@]+@[^\.]+\..+/, message: 'Enter valid
    email address' }
  validates :branch_id, presence: { message: 'Select Branch' }
  validates :fname, format: { with: /[a-zA-Z]{2,20}/, message: 'Enter valid
    First Name(minimum 2 characters)' }
  validates :lname, format: { with: /[a-zA-Z]{2,20}/, message: 'Enter valid
    Last Name(minimum 2 characters)' }
  validates :mobile, format: { with: /[0-9]{10}/, message: 'Enter valid mobile
    number(10 digits)' }, on: :faculty
  # validates :mobile, absence: true, on: :student
  validates :pass_out_year, format: { with: /[0-9]{4}/, message: 'Enter valid
    year(4 digits only)' }, on: :student
  validates :semester_id, presence: { message: 'Select Semester' }, on: :student
  validates :enrollment, format: { with: /[0-9]/, message: 'Enter valid
    enrollment' }, on: :student
  validates :password, length: { in: 6..20, message: 'Password length should be
    between 6-20' }, on: :student
  validates :password, length: { in: 6..20, message: 'Password length should be
    between 6-20' }, on: :faculty
  has_many :results, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  belongs_to :branch, optional: true
  belongs_to :semester, optional: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['enrollment = :value OR lower(email) = :value',
                             { value: login.strip.downcase }]).first
  end

  def self.import(file)
    imported_students = skipped_students = 0
    CSV.foreach(file.path, headers: true) do |row|
      # binding.pry
      User.create! row.to_hash
      User.last.add_role(:student)
      imported_students += 1
    rescue StandardError
      skipped_students += 1
      next
    end
    [imported_students, skipped_students]
  end

  # after_create do
  #   puts '=========================after create'
  # end

  # after_commit do
  #   puts '=========================after commit'
  # end
  # validates :enrollment, presence: true

  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  # validates_confirmation_of :password, message: "Should match"
  # validates_presence_of :password_confirmation, if: :password_changed?
end
