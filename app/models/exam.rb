# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :user
  has_one :result, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :subject
end
