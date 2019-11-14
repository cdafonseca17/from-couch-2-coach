class ReviewsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.course = @course
    if @review.save
      redirect_to course_path(@course)
    else
      render 'courses/show'
    end
  end

  def average_rating
    @course = Course.find(params[:course_id])
    total_stars = @course.reviews.map do |review|
      review.stars
    end
    @average_rating = total_stars.sum / total_stars.count
    return @average_rating
  end

  private

  def review_params
    params.require(:review).permit(:stars, :description)
  end
end
