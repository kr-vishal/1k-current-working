import { initializeApp } from "firebase/app";
import { getMessaging, getToken } from "firebase/messaging";

let firebaseApp;
const SERVER_KEY =
  "BDu3O1a8DSjM9h33F0VqsGVj-OedSPMpqnsM_axt92DEhcor-Nqi2yAfOSMGd1wPECgOnmdkmRW0IWthDLx191U";
const firebaseConfig = {
  apiKey: "AIzaSyALC_QZti0PEPl5kp---zhPjMJYUXSspp4",
  authDomain: "embed-4c95e.firebaseapp.com",
  projectId: "embed-4c95e",
  storageBucket: "embed-4c95e.appspot.com",
  messagingSenderId: "99038237780",
  appId: "1:99038237780:web:68d81b766b5f5e4d56c9c1",
  measurementId: "G-CCZPYLYBMF",
};

export const initializeFirebase = () => {
  console.log("Firing");
  firebaseApp = initializeApp(firebaseConfig);
};

export const askForPermissionToReceiveNotifications = (setTokenFound) => {
  const messaging = getMessaging(firebaseApp);

  return getToken(messaging, { vapidKey: SERVER_KEY })
    .then((currentToken) => {
      if (currentToken) {
        console.log("current token for client: ", currentToken);
        setTokenFound(true);
        // Track the token -> client mapping, by sending to backend server
        // show on the UI that permission is secured
      } else {
        console.log(
          "No registration token available. Request permission to generate one."
        );
        setTokenFound(false);
        // shows on the UI that permission is required
      }
    })
    .catch((err) => {
      console.log("An error occurred while retrieving token. ", err);
      // catch error while creating client token
    });
};

/* export const askForPermissionToReceiveNotifications = async () => {
  try {
    const messaging = firebase.messaging();
    await messaging.requestPermission();
    const token = await messaging.getToken();
    console.log("Your token is:", token);

    return token;
  } catch (error) {
    console.error(error);
  }
}; */
