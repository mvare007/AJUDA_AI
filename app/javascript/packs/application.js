import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import 'user/show';

// Map
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

// Review Star Rating
import { initStarRating } from '../plugins/init_star_rating';
initStarRating();

// Emoji Picker
import { emojiPicker } from '../emoji/emoji';
emojiPicker();


const submitForms = () => {
  const forms = document.querySelectorAll("#new_review");
  const button = document.querySelector('#submitReviews');
  if (button) {
    button.addEventListener('click', (event) => {
      forms.forEach((form) => {
        form.submit();
      });
    });
  };
};

submitForms()

import { previewImageOnFileSelect } from '../components/photo_preview';
previewImageOnFileSelect();
