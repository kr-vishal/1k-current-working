// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getFirestore, collection, getDocs } from "firebase/firestore/lite";

const firebaseConfig = {
  apiKey: "AIzaSyA_RPwefYlq1ZSOZaMD6iR7TnmtSxtQq_Y",
  authDomain: "vidya-prod-f2207.firebaseapp.com",
  projectId: "vidya-prod-f2207",
  storageBucket: "vidya-prod-f2207.appspot.com",
  messagingSenderId: "65820137593",
  appId: "1:65820137593:web:b3247a1124a58a689b5ca8",
  measurementId: "G-1RKY9G44HM",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

const db = getFirestore(app);

export default db;
