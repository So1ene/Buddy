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

// Internal imports
import { navbar } from '../components/navbar';
import { filters } from '../components/filters';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initUserChannelCable } from '../channels/user_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here
  initAutocomplete();
  initUserChannelCable();
  navbar();
  filters();

  // SUBMITS MESSAGE ON ENTER! :D But not shift-enter
      function submitOnEnter(event){
      if(event.which === 13 && !event.shiftKey){
          event.target.form.dispatchEvent(new Event("submit", {cancelable: true}));
          event.preventDefault();
          event.target.form.submit();
      }
  }

  document.getElementById("new_message").addEventListener("keypress", submitOnEnter);

});




