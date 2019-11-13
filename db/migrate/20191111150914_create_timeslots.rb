class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.date :date
      t.time :time
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
