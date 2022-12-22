$(document).ready(function() {
  $.get('http://127.0.0.1:5001/api/v1/status/', function(xhr) {
    if(xhr.status === 'OK') {
      $('div#api_status').addClass('available');
    } else {
      $('div#api_status').removeClass('available');
    }
  });

  })
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
 