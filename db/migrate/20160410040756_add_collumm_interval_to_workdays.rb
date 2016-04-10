class AddCollummIntervalToWorkdays < ActiveRecord::Migration
  def change
    add_column :work_days, :interval, :integer
  end
end
