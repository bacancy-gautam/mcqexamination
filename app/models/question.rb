class Question < ApplicationRecord
    has_many :options
    has_one :useran

    belongs_to :exam
end
