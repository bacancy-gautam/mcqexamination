# frozen_string_literal: true

# option model
class Option < ApplicationRecord
  belongs_to :question
  validates :option_index, presence: true
  validates :name, presence: true
  has_one :user_answer, dependent: :destroy
end
