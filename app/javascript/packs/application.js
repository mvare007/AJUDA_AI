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


// Request show page image carousel
 $('#myCarousel').carousel({
    interval: 2500,
 });


// Emoji Picker
import { emojiPicker } from '../emoji/emoji';
emojiPicker();
