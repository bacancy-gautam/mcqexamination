class Exam < ApplicationRecord
    belongs_to :user
    has_one :result
    has_many :assigns
    has_many :questions

end
