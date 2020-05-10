module ApplicationHelper
  def mean_review(user_reviews)
    ratings_array = []
    user_reviews.each do |review|
      ratings_array << review.rating
    end
    mean = ratings_array.sum(0.0) / ratings_array.size
  end
end

