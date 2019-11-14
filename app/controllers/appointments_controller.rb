class AppointmentsController < ApplicationController
  before_action :set_course
  def newclass AppointmentsController < DelegateClass(ParentClass)
    def initialize(args)
      super(del_obj)


    end


  end
    @appointment = Appointment.new
    @timeslots = Timeslot.where(course_id: params[:course_id])
  end

  def create
    @appointment = Appointment.new(params_create)
    @appointment.user = current_user
    authorize @appointment

    if @appointment.save
      redirect_to managecourses_path
    else
      @timeslots = Timeslot.where(course_id: params[:course_id])
      render :new
      # p @appointment.errors
    end
  end

private

  def params_create
    params.require('appointment').permit(:timeslot_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
