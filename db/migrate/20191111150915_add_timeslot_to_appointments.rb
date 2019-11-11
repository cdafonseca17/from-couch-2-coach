class AddTimeslotToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :timeslot, foreign_key: true
  end
end
