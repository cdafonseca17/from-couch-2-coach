class RemoveCourseIdFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :appointments, :course_id, foreign_key: true
  end
end
