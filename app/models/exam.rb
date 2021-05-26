class Exam < ActiveRecord::Base
    has_many :student_exams
    has_many :students, through: :student_exams

    def insert_feedback(student, grade, comment)
        StudentExam.create(grade: grade, teacher_comment: comment, exam_id: self.id, student_id: student.id)
    end

    def class_average
        self.student_exams.average(:grade).to_i
    end

    def self.used_exams
        Exam.all.select do |exam|
         exam.students.length > 0
        end
    end

    def self.lowest_average
        student_exams = self.used_exams.map do |exam|
            exam.student_exams
        end

        mini_average = student_exams.map do |student_exam|
            mini = student_exam.average(:grade)
        end.min()

        lowest_id = student_exams.select do |student_exam|
            student_exam.average(:grade) ==  mini_average
        end.map do |student_exam|
            student_exam.map do |student_exam|
                student_exam.exam_id
            end.uniq
        end

        Exam.find(lowest_id)
    end

    def self.drop_lowest_average
         lowest_student_exam = self.lowest_average.first.student_exams
        
    end
end


