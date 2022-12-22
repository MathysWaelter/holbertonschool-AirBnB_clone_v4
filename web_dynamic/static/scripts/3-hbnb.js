$(document).ready(function() {
  $.get('http://127.0.0.1:5001/api/v1/status/', function(xhr) {
    if(xhr.status === 'OK') {
      $('div#api_status').addClass('available');
    } else {
      $('div#api_status').removeClass('available');
    }
});

function define_place(place)
{
    let word_guest = "Guest";
    let word_bedroom = "Room";
    let word_bathroom = "Bathroom";
    if (place.max_guest != 1) {
        word_guest += "s";
    }
    if (place.number_rooms != 1) {
        word_bedroom += "s";
    }
    if (place.number_bathrooms != 1) {
        word_bathroom += "s";
    }
    return $('\
    <article>\
	  <div class="title_box">\
	    <h2>'
        + place.name +
        '</h2>\
	    <div class="price_by_night">'
        + place.price_by_night + 
        '</div>\
	  </div>\
	  <div class="information">\
	    <div class="max_guest">'
            + place.max_guest
            + ' ' + word_guest
            + '</div>\
        <div class="number_rooms">'
            + place.number_rooms
            + ' ' + word_bedroom
            + '</div>\
        <div class="number_bathrooms">'
            + place.number_bathrooms
            + ' ' + word_bathroom
            + '</div>\
	  </div>\
      <div class="description">'
    + place.description + 
      '</div>\
	</article>\
    ');
  }

  $.ajax({
      type: "POST",
      url: "http://127.0.0.1:5001/api/v1/places_search/",
      contentType: "application/json",
      data: "{}",
      success: function (data, status, xhr) {
            for (place in data) {
                $("section.places").append(define_place(data[place]));
            }
        }
    });
    // Create an empty list to store the Amenity IDs
    var amenityNames = [];
  

    // Listen for changes on each input checkbox tag
    $("input[type='checkbox']").change(function() {
      // Get the Amenity ID of the checkbox
      var amenityName = $(this).attr("data-name").replace("/", "");

      // If the checkbox is checked, add the Amenity ID to the list
      if ($(this).is(":checked")) {
        amenityNames.push(amenityName);

      }
      // If the checkbox is unchecked, remove the Amenity ID from the list
      else {
        amenityNames = amenityNames.filter(function(name) {
          return name !== amenityName;
        });
      }

      // Update the h4 tag with the list of Amenity IDs
      $("div.amenities h4").text(amenityNames.join(", "));
    });
  });
 