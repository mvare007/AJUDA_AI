import "jquery-bar-rating";

const initStarRating = () => {
  $('.form-group #review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };

