class AppointmentsController < ApplicationController
  before_action :set_course
  # def newclass AppointmentsController < DelegateClass(ParentClass)
  #   def initialize(args)
  #     super(del_obj)
  #   end
  # end

  def new
    @appointment = Appointment.new
    @timeslots = Timeslot.where(course_id: params[:course_id])
  end

  def create
    params["appointment"]["timeslot"].filter { |i| !i.empty? }.each do |t|
      @appointment = Appointment.new(user: current_user, timeslot_id: t.to_i)
      @appointment.user = current_user
      authorize @appointment
      @appointment.save!
    end
    # @appointment.timeslot = Timeslot.find()
    #
    # if @appointment.save
    #   redirect_to course_path(@course)
    # else
    #   @timeslots = Timeslot.where(course_id: params[:course_id])
    #   render :new
    #   # p @appointment.errors
    # end
  end

private
  def params_create
    params.require('appointment').permit(:timeslot_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
