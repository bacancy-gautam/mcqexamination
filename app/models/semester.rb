# frozen_string_literal: true

# model for semester
class Semester < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :subjects, dependent: :destroy
end
