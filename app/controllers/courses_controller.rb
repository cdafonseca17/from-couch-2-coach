class CoursesController < ApplicationController
  def index
    @courses = Course.all
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
    params.require('course').permit(:name, :category, :description, :address, :photo)
  end

  def params_update
    params.require('course').permit(:name, :category, :description, :address, :photo)
  end
end
