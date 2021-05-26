class StudentExams < ActiveRecord::Migration[6.1]
  def change
    create_table :student_exams do |t|
      t.integer :grade
      t.string :teacher_comment
      t.integer :exam_id
      t.integer :student_id
    end
  end
end
