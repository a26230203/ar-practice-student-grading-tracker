class StudentExam < ActiveRecord::Base
    belongs_to :student
    belongs_to :exam

    def print_details
        puts "#{self.student.name} took the #{self.exam.subject} exam receiving a score of #{self.grade}"
    end

    def questions_correct_ratio
        "#{self.exam.total_questions / 10 } questions correct out of 20 questions total"
    end

end
