import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import reportWebVitals from "./reportWebVitals";
import { initializeFirebase } from "./push-notification";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import "./assets/css/animate.css";
import "./assets/css/main.css";
// import i18n (needs to be bundled ;))
import "./utils/i18n";
import { postApiCall } from "./utils/constants";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

initializeFirebase();
// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
function sendAnalyticsData(metric) {
  postApiCall("capture-analytics", metric);
}

reportWebVitals(sendAnalyticsData);
