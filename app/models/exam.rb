# frozen_string_literal: true

# Exam model
class Exam < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :subject
  # validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
end
