import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
let map = null;


// Fits the map to the displayed markers
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();

  markers.forEach((marker) => {
    bounds.extend([ marker.longitude, marker.latitude]);
  });

  map.fitBounds( bounds, { padding: 70, maxZoom: 15, duration: 0 } );
}

// Add a marker to the map
const addMarkerToMap = (marker) => {
  console.log('addMarkerToMap');
  console.log(marker)
  console.log(map)
  new mapboxgl.Marker().setLngLat([marker.longitude, marker.latitude]).addTo(map)

};

// Map initialization
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    // markers.forEach( (marker) => {
    //   addMarkerToMap(marker, map);
    // });

    // Fit th maps bounds to the markers
    fitMapToMarkers(map, markers);

    //
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

  }
};

export { initMapbox, addMarkerToMap };
