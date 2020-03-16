# frozen_string_literal: true

# Exam model
class Exam < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :subject
  validates :name, format: { with: /[a-zA-Z]+/, message: 'name should be started
                                                          with alphabets' }
  validates :passing_marks, format: { with: /[0-9]+/, message: 'Enter valide
                                                                marks' }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
