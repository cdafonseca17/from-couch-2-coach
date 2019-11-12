class ReviewsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.course = @course
    @review.save
    redirect_to course_path(@course)
  end

  private

  def review_params
    params.require(:review).permit(:stars, :description)
  end
end

def new
  @course = Course.find(params[:course_id])
  @review = Review.new
end
