$(document).ready(function() {
    // Create an empty list to store the Amenity IDs
    var amenityNames = [];
  

    // Listen for changes on each input checkbox tag
    $("input[type='checkbox']").change(function() {
      // Get the Amenity ID of the checkbox
      var amenityName = $(this).attr("data-name");

      // If the checkbox is checked, add the Amenity ID to the list
      if ($(this).is(":checked")) {
        amenityNames.push(amenityName.replace("/", ""));

      }
      // If the checkbox is unchecked, remove the Amenity ID from the list
      else {
        amenityNames = amenityNames.filter(function(id) {
          return id !== amenityName;
        });
      }

      // Update the h4 tag with the list of Amenity IDs
      $("div.amenities h4").text(amenityNames.join(", "));
    });
  });