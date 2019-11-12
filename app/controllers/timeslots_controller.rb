class TimeslotsController < ApplicationController
  before_action :set_course

  def index
    @timeslots = Timeslot.all
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(params_create)
    @timeslot.course_id = @course.id
    if @timeslot.save
      redirect_to course_timeslots_path(@course.id)
    else
      render :new
      # p @timeslot.errors
    end
  end

  def edit
    @timeslot = Timeslot.find(params[:id].to_i)
  end

  def update
    @timeslot = Timeslot.find(params[:id].to_i)

    if @timeslot.update(params_update)
      redirect_to course_timeslot_path
    else
      render :new
    end
  end

  def destroy
    @timeslot = Timeslot.find(params[:id].to_i)
    @timeslot.destroy
    redirect_to course_timeslots_path
  end

  private

  def params_create
    params.require('timeslot').permit(:date, :time)
  end

  def params_update
    params.require('timeslot').permit(:date, :time)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
