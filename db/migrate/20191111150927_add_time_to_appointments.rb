class AddTimeToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :time, foreign_key: true
  end
end
