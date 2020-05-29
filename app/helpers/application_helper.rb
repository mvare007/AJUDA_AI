module ApplicationHelper

  def mean_review(user_reviews)
    ratings_array = []
    user_reviews.each do |review|
      ratings_array << review.rating
    end
    mean = ratings_array.sum(0.0) / ratings_array.size
  end

  def results
    results = @requests.count + @users.count if @requests || @users
  end

  def select_category(category_name)
    @requests = Request.where(category: category_name)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def ordered_by_creation(array)
    array.order(:created_at).reverse
  end

end

