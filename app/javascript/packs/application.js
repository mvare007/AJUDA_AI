import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import { initStarRating } from '../plugins/init_star_rating';

initStarRating();


// Landing page carousel

 $('#myCarousel').carousel({
    interval: 2500,
 });


$(function() {
    $('#settingsFollowing').click(function(e) {
      $('#panelFollowing').toggle();
    });
});


$(function() {
    $('#settingsFollowers ').click(function(e) {
        $('#panelFollowers').toggle();
    });
});

