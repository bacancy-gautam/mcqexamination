# frozen_string_literal: true

# Branch model
class Branch < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :subjects, dependent: :destroy
end
