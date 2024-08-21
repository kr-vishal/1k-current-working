import React from "react";
import logo from "./logo.svg";
import "./App.css";
import db from "./includes/db";
import { collection, getDocs, query, where } from "firebase/firestore/lite";

async function dumbDb() {
  const citiesCol = collection(db, "sessions");
  //const citySnapshot = await getDocs(citiesCol);
  //const cityList = citySnapshot.docs.map((doc) => doc.data());
  //console.log(cityList);
  const q = query(
    citiesCol,
    where("class_id", "==", "6357df9564aa88a8a502d046")
  );
  const querySnapshot = await getDocs(q);
  querySnapshot.forEach((doc) => {
    // doc.data() is never undefined for query doc snapshots
    console.log(doc.id, " => ", doc.data());
  });
}

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <button onClick={dumbDb}>Dump DB</button>
      </header>
    </div>
  );
}

export default App;
