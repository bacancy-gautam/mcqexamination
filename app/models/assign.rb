# frozen_string_literal: true

class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  accepts_nested_attributes_for :user, reject_if: :all_blank,
                                          allow_destroy: true
end
