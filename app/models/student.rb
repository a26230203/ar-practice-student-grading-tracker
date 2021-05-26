class Student < ActiveRecord::Base
    has_many :student_exams
    has_many :exams, through: :student_exams
end
