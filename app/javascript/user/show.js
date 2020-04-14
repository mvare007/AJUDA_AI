// User Show Profile Card toggler

$(function() {
    $('#settingsFollowing').click(function(e) {
      $('#panelFollowing').toggle();
    });
});

const setFollowing = document.getElementById("settingsFollowing")
const following = document.getElementById("panelFollowing")

if (setFollowing && following) {
  setFollowing.addEventListener('click', (event) => {
    following.classList.add("swing-in-top-fwd");
  });
};


$(function() {
    $('#settingsFollowers ').click(function(e) {
        $('#panelFollowers').toggle();
    });
});

const setFollowers = document.getElementById("settingsFollowers");
const followers = document.getElementById("panelFollowers");

if (setFollowers && followers) {
  setFollowers.addEventListener('click', (event) => {
    followers.classList.add("swing-in-top-fwd");
  });
};



$(function() {
    $('#settingsUserRequests').click(function(e) {
        $('#panelUserRequests').toggle();
    });
});

const setUserRequests = document.getElementById("settingsUserRequests")
const userRequests = document.getElementById("panelUserRequests")
if (setUserRequests && userRequests) {
  setUserRequests.addEvent
  Listener('click', (event) => {
    userRequests.classList.add("swing-in-top-fwd");
  });
};
