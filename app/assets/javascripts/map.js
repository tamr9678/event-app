handler = Gmaps.build('Google');
handler.buildMap({
  provider: {
    zoom: 12,
    center:    new google.maps.LatLng(#{@event.latitude}, #{@event.longitude}),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  },
  internal: {id: 'map'}}, function(){
  handler.fitMapToBounds();
});