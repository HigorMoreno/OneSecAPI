class RenameNameInEmployee < ActiveRecord::Migration
  def change
  	rename_column :employees, :nome, :name
  end
end
