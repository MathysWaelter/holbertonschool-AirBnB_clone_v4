$(document).ready(function() {
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
    // Create an XMLHttpRequest object
    var xhr = new XMLHttpRequest();
  
    // Set the callback function to be called when the request is completed
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        // Request is complete and successful
        var apiStatus = xhr.responseText;
        if (apiStatus == "OK") {
          // Add the class "available" to the element with ID "api_status"
          document.getElementById("api_status").classList.add("available");
        } else {
          // Remove the class "available" from the element with ID "api_status"
          document.getElementById("api_status").classList.remove("available");
        }
      }
    }
  
    // Send the request
    xhr.open("GET", "http://0.0.0.0:5001/api/v1/status/", true);
    xhr.send();
  });

  