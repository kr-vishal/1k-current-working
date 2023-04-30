import Hero from "./Hero";
import { Suspense, lazy } from "react";

const renderLoader = () => <p>Loading</p>;
const Features = lazy(() => import("./Features"));
const TopRacers = lazy(() => import("./TopRacers"));
const Contact = lazy(() => import("./Contact"));

function AllComponents() {
  return (
    <>
      <Hero />
      <Suspense fallback={renderLoader()}>
        <Features />
        <TopRacers />
        <Contact />
      </Suspense>
    </>
  );
}

export default AllComponents;
