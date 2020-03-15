# frozen_string_literal: true

# subject model
class Subject < ApplicationRecord
  validates :name, format: { with: /[a-zA-Z]/, message: "name should be started with alphabets" }
  # validates :branch_id, presence: true
  # validates :semester_id, presence: true
  belongs_to :semester
  belongs_to :branch
  has_many :exams, dependent: :destroy
end
