import "../App.css";
import AllComponents from "./AllComponents";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./Layout";
import Offline from "./Offline";

function MainApp() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<AllComponents />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default MainApp;
