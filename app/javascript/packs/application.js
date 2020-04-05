import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import { initStarRating } from '../plugins/init_star_rating';

initStarRating();


// Request show page image carousel

 $('#myCarousel').carousel({
    interval: 2500,
 });




// User Show Profile Card

$(function() {
    $('#settingsFollowing').click(function(e) {
      $('#panelFollowing').toggle();
    });
});

const setFollowing = document.getElementById("settingsFollowing")
const following = document.getElementById("panelFollowing")
  setFollowing.addEventListener('click', (event) => {
    following.classList.add("swing-in-top-fwd");
});




$(function() {
    $('#settingsFollowers ').click(function(e) {
        $('#panelFollowers').toggle();
    });
});

const setFollowers = document.getElementById("settingsFollowers");
const followers = document.getElementById("panelFollowers");
  setFollowers.addEventListener('click', (event) => {
    followers.classList.add("swing-in-top-fwd");
});



$(function() {
    $('#settingsUserRequests').click(function(e) {
        $('#panelUserRequests').toggle();
    });
});

const setUserRequests = document.getElementById("settingsUserRequests")
const userRequests = document.getElementById("panelUserRequests")
  setUserRequests.addEventListener('click', (event) => {
    userRequests.classList.add("swing-in-top-fwd");
});
