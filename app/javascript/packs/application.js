// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();



  // Navbar

  const body = document.getElementById('body');
  const openMenu = document.getElementById('menuControlOpen');
  const closeMenu = document.getElementById('menuControlClose');
  const dimBackground = document.getElementById('dim-background')

  openMenu.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("hide-dim-background");
  dimBackground.classList.add("show-dim-background");
  });

  closeMenu.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("show-dim-background");
  dimBackground.classList.add("hide-dim-background");
  });

  dimBackground.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("show-dim-background");
  dimBackground.classList.add("hide-dim-background");
  });

  // Filters

  const filters = document.querySelectorAll('.filter')
  for (const filter of filters) {
  filter.addEventListener('click', function(event) {
    filter.classList.toggle("deselected-filter");
  })
}

});




