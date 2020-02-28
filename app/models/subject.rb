# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :semester
  belongs_to :branch
  has_many :exams, dependent: :destroy
end
