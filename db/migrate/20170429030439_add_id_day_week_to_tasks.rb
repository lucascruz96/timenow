class AddIdDayWeekToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :idDayWeek, :int
  end
end
