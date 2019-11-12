class RemoveTimeFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :time
  end
end
