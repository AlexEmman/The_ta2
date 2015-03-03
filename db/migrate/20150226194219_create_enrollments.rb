class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :teacher, index: true
      t.references :student, index: true
      t.references :course, index: true
      t.integer :points

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :teachers
    add_foreign_key :enrollments, :students
    add_foreign_key :enrollments, :courses
  end
end
