class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def managecourses
    @courses = Course.where(user: current_user)
    @appointments = Appointment.where(user: current_user)
  end
end
