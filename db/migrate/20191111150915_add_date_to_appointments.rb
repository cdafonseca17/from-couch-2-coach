class AddDateToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :date, foreign_key: true
  end
end
