import { Outlet } from "react-router-dom";
import Header from "./Header";
import PreLoader from "./PreLoader";
import { Suspense, lazy } from "react";
const renderLoader = () => <p>Loading</p>;
const Footer = lazy(() => import("./Footer"));

export default function Layout({ hideMenu = false }) {
  return (
    <>
      <PreLoader />
      <Header hideMenu={hideMenu} />
      <Outlet />
      <Suspense fallback={renderLoader()}>
        <Footer />
      </Suspense>
    </>
  );
}
