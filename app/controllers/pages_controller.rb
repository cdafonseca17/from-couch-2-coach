class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
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

  def managecourses
    @courses = Course.where(user: current_user)
    @appointments = Appointment.where(user: current_user)
  end

  private

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
