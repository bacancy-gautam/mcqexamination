# frozen_string_literal: true

# subject model
class Subject < ApplicationRecord
  belongs_to :semester
  belongs_to :branch
  has_many :exams, dependent: :destroy
  validates :semester_id, presence: true
end
