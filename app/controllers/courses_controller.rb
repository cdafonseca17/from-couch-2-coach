class CoursesController < ApplicationController
  def index
    @categories = ["Yoga", "Running", "Fitness", "Kickboxing", "Spinning", "Powerlifting"]
    @cities = ["Amsterdam", "London", "Paris"]
    @courses = policy_scope(Course).order(created_at: :desc)
    if params[:search].nil?
      @courses = Course.all
      @courses = policy_scope(Course)
    else
      filter_courses
    end
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
  end

  def create
    @course = Course.new(params_create)
    @course.user = current_user
    authorize @course
    if @course.save
      redirect_to managecourses_path
    else
      render :new
    end
  end

  def update
    @course = Course.find(params[:id].to_i)
    authorize @course
    if @course.update(params_update)
      redirect_to managecourses_path
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id].to_i)
    authorize @course
    @course.destroy
    redirect_to managecourses_path
  end

  private

  def params_create
    params.require('course').permit(:name, :category, :description, :address, :city, :photo)
  end

  def params_update
    params.require('course').permit(:name, :category, :description, :address, :city, :photo)
  end

  def filter_courses
    @courses = Course.all
    # authorize @course
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
