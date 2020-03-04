# frozen_string_literal: true

# ll
class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_one :useran
  belongs_to :exam
  accepts_nested_attributes_for :options, reject_if: :all_blank,
                                          allow_destroy: true
end
