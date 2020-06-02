import places from 'places.js';

const initAutocomplete = () => {
  let addressInput = document.getElementById('user_search_location');
  if (!addressInput) {
    addressInput = document.getElementById('event_address');
  }
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };