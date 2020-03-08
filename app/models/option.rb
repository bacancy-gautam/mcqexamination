# frozen_string_literal: true

# option model
class Option < ApplicationRecord
  belongs_to :question
  has_one :user_answer, dependent: :destroy
end
