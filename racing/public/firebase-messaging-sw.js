importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyALC_QZti0PEPl5kp---zhPjMJYUXSspp4",
  authDomain: "embed-4c95e.firebaseapp.com",
  projectId: "embed-4c95e",
  storageBucket: "embed-4c95e.appspot.com",
  messagingSenderId: "99038237780",
  appId: "1:99038237780:web:68d81b766b5f5e4d56c9c1",
  measurementId: "G-CCZPYLYBMF",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
  console.log("Received background message ", payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});
