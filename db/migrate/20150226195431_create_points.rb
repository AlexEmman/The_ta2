class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :enrollment, index: true

      t.timestamps null: false
    end
    add_foreign_key :points, :enrollments
  end
end
