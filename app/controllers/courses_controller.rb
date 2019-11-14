class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @courses = policy_scope(Course)
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
    params.require('course').permit(:name, :category, :description, :address, :photo)
  end

  def params_update
    params.require('course').permit(:name, :category, :description, :address, :photo)
  end
end
