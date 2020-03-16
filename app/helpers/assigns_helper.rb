# frozen_string_literal: true

# helper for assign
module AssignsHelper
  def student_assigned?(student, exam)
    student.assigns.where(exam_id: exam.id).blank?
  end
end
