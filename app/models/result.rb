# frozen_string_literal: true

# model for result
class Result < ApplicationRecord
  belongs_to :user
  belongs_to :exam
end
