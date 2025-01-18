<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/selectDate.css">
    <title>Select Date and Time Slot</title>
    <script>
        // Populate sub-city options based on selected city
        function populateSubCity() {
            var cityDropdown = document.getElementById("city");
            var subCityDropdown = document.getElementById("sub-city");
            var subCityContainer = document.getElementById("sub-city-container");

            // Clear previous sub-city options
            subCityDropdown.innerHTML = '<option value="">Select Sub-City</option>';

            var selectedCity = cityDropdown.value;

            // Show sub-cities based on the selected city
            if (selectedCity === "mumbai") {
                var mumbaiSubCities = ['Bandra', 'Versova', 'Andheri'];
                mumbaiSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else if (selectedCity === "pune") {
                var puneSubCities = ['Shivajinagar', 'Kothrud', 'Baner'];
                puneSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else if (selectedCity === "nagpur") {
                var nagpurSubCities = ['Sitabuldi', 'Dharampeth', 'Wardha Road'];
                nagpurSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else if (selectedCity === "nashik") {
                var nashikSubCities = ['Panchavati', 'Mahatma Nagar', 'CIDCO'];
                nashikSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else if (selectedCity === "aurangabad") {
                var aurangabadSubCities = ['Garkheda', 'CIDCO', 'Jalna Road'];
                aurangabadSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else if (selectedCity === "solapur") {
                var solapurSubCities = ['Sidheshwar', 'Akkalkot Road', 'Hotgi Road'];
                solapurSubCities.forEach(function (subCity) {
                    var option = document.createElement("option");
                    option.value = subCity.toLowerCase();
                    option.text = subCity;
                    subCityDropdown.appendChild(option);
                });
                subCityContainer.style.display = 'block';
            } else {
                subCityContainer.style.display = 'none';
            }
        }

        // Set minimum date to today's date
        function setMinDate() {
            var today = new Date();
            var year = today.getFullYear();
            var month = (today.getMonth() + 1).toString().padStart(2, '0');
            var day = today.getDate().toString().padStart(2, '0');
            var minDate = year + '-' + month + '-' + day;

            document.getElementById("date").setAttribute("min", minDate);
        }

        window.onload = function() {
            setMinDate(); // Set minimum date on page load
        };
    </script>
</head>
<body>
    <div class="container">
        <h1>Select Your Slot</h1>
        <form action="confirm.jsp" method="post">
            <!-- City Dropdown -->
            <label for="city">Choose a City:</label>
            <select id="city" name="city" class="city-dropdown" onchange="populateSubCity()" required>
                <option value="">Select City</option>
                <option value="mumbai">Mumbai</option>
                <option value="pune">Pune</option>
                <option value="nagpur">Nagpur</option>
                <option value="nashik">Nashik</option>
                <option value="aurangabad">Aurangabad</option>
                <option value="solapur">Solapur</option>
            </select><br><br>

            <!-- Sub-City Dropdown -->
            <div id="sub-city-container" style="display:none;">
                <label for="sub-city">Choose a Sub-City:</label>
                <select id="sub-city" name="sub-city" class="sub-city-dropdown" required>
                    <option value="">Select Sub-City</option>
                </select><br><br>
            </div>

            <!-- Date Selector -->
            <label for="date">Choose a Date:</label>
            <input type="date" id="date" name="date" required><br><br>

            <!-- Time Slot Selection -->
            <label for="time-slot">Choose a Time Slot:</label><br>
            <input type="radio" id="slot1" name="time-slot" value="11:00 AM - 1:00 PM" required>
            <label for="slot1">11:00 AM - 1:00 PM</label><br>
            <input type="radio" id="slot2" name="time-slot" value="3:00 PM - 6:00 PM" required>
            <label for="slot2">3:00 PM - 6:00 PM</label><br><br>

            <!-- Submit Button -->
            <button type="submit">Confirm Slot</button>
        </form>
    </div>
</body>
</html>
