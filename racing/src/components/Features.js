import React, { useEffect, useState } from "react";
import race_img from "../assets/img/race.webp";
import { getApiCall } from "../utils/constants";
import { useTranslation } from "react-i18next";

export default function Features() {
  const [races, setRaces] = useState([]);
  const { t } = useTranslation();

  useEffect(() => {
    getApiCall("races").then((response) => {
      if (response.status) {
        setRaces(response.data);
      }
    });
  }, []);

  return (
    <section id="fixtures" className="feature-section pt-150">
      <div className="container">
        <div className="row">
          <div className="col-xl-7 col-lg-8 mx-auto">
            <div className="section-title text-center mb-55">
              <h2 className="mb-20 wow fadeInUp" data-wow-delay=".2s">
                {t("Fixtures")}
              </h2>
              <p className="wow fadeInUp" data-wow-delay=".4s">
                {t("Here is the list of upcoming races.")}
              </p>
            </div>
          </div>
        </div>
        <div className="features-wrapper">
          <div className="row justify-content-center">
            {races.length > 0 ? (
              races.map((race, index) => {
                return (
                  <div key={index} className="col-xl-4 col-lg-4 col-md-6">
                    <div
                      className="single-feature text-center mb-30 wow fadeInUp"
                      data-wow-delay=".2s"
                    >
                      <div className="feature-img mb-20">
                        <img src={race_img} alt={`${race.name} fixture`} />
                      </div>
                      <div className="feature-content">
                        <h1 style={{ color: "white" }}>{race.name}</h1>
                        <p>
                          {t("Date")} :{" "}
                          {new Date(race.race_date).toLocaleDateString()}
                        </p>
                      </div>
                    </div>
                  </div>
                );
              })
            ) : (
              <div className="row justify-content-center">
                <div className="col-xl-4 col-lg-4 col-md-6">
                  <p>{t("Loading Fixtures...")}</p>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
