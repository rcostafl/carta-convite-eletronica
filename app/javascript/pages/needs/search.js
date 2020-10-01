import { addMarkerToMap } from '../../plugins/init_mapbox.js';

const asyncSearch = async (event) => {
  event.preventDefault();

  const url = `http://${location.host}/needs/geo_search`;
  const response = await fetch(url); // returns the data
  const markers = await response.json(); // parse data do json
  console.log(markers.needs);
  markers.needs.forEach((marker, index, array) => {
    console.log(marker);
    addMarkerToMap(marker);
  });
}


const addEventListenerToSearchForm = () => {
  const searchForm = document.getElementById('need-search-form');

  if (searchForm) {
    searchForm.addEventListener('submit', asyncSearch);
  }

}


export { addEventListenerToSearchForm };
