# frozen_string_literal: true

# ll
class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  belongs_to :exam
  validates :info, presence: true
  validates_associated :options
  accepts_nested_attributes_for :options, reject_if: :all_blank,
                                          allow_destroy: true
end
