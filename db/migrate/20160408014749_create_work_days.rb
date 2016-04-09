class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.integer :day
      t.time :start_morning_time
      t.time :end_morning_time
      t.time :start_afternoon_time
      t.time :end_afternoon_time
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
