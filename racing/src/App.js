import React, { useEffect, useState } from "react";
import {
  getExternalApiCall,
  getThemeColorForLocation,
} from "./utils/constants";
import MainApp from "./components/MainApp";
import { askForPermissionToReceiveNotifications } from "./push-notification";

function App() {
  const [token, setToken] = useState(null);

  useEffect(() => {
    const userLocation = process.env.REACT_APP_USER_LOCATION;
    if (userLocation && userLocation.length > 0) {
      getThemeColorForLocation(userLocation).then((color_theme) => {
        if (color_theme) document.body.classList.add(color_theme);
      });
    } else if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        function (position) {
          const username = process.env.REACT_APP_GEO_API_USERNAME;
          const locationUrl = `${process.env.REACT_APP_GEO_API_URL}?lat=${position.coords.latitude}&lng=${position.coords.longitude}&username=${username}`;
          getExternalApiCall(locationUrl).then((response) => {
            if (response.countryCode) {
              getThemeColorForLocation(response.countryCode).then(
                (color_theme) => {
                  document.body.classList.add(color_theme);
                }
              );
            }
          });
        },
        function (error) {
          console.error("Error Code = " + error.code + " - " + error.message);
        }
      );
    }

    askForPermissionToReceiveNotifications(setToken).then(() => {
      console.log(token);
    });
  }, []);
  return (
    <div className="App">
      <MainApp />
    </div>
  );
}

export default App;
