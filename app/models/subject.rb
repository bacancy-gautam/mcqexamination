class Subject < ApplicationRecord
    belongs_to :semester
    belongs_to :branch
    has_many :exams

end
