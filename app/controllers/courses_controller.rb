class CoursesController < ApplicationController
  def index
    @categories = ["Yoga", "Running", "Fitness", "Kickboxing", "Spinning", "Powerlifting"]
    @cities = ["Amsterdam", "London", "Paris"]
    if params[:search].nil?
      @courses = Course.all
    else
      filter_courses
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params_create)
    @course.user = current_user
    if @course.save
      redirect_to managecourses_path
    else
      render :new
    end
  end

  def update
    @course = Course.find(params[:id].to_i)
    if @course.update(params_update)
      redirect_to managecourses_path
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id].to_i)
    @course.destroy
    redirect_to managecourses_path
  end

  private

  def params_create
    params.require('course').permit(:name, :category, :description, :address, :city)
  end

  def params_update
    params.require('course').permit(:name, :category, :description, :address, :city)
  end

  def filter_courses
    @courses = Course.all
    # @courses = policy_scope(Course)
    search_params = params[:search]
    if search_params[:category].present?
      @courses = @courses.where(category: search_params[:category])
    end
    if search_params[:city].present?
      @courses = @courses.where(city: search_params[:city])
    end
    if search_params[:date].present?

      # @courses = Course.joins(:timeslots).where('timeslots.date = ?', search_params[:date])
      @courses = Course.joins(:timeslots).where(timeslots: { date: search_params[:date] })
    end
  end
end
