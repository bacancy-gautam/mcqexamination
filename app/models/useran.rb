# frozen_string_literal: true

class Useran < ApplicationRecord
  belongs_to :user
  belongs_to :question
end
