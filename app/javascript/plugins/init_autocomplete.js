import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    console.log('encontrei');
    places({ container: addressInput });
  }
};

export { initAutocomplete };
