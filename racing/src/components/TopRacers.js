import React, { useEffect, useState } from "react";
import { Table } from "react-bootstrap";
import { getApiCall } from "../utils/constants";
import { useTranslation } from "react-i18next";

export default function TopRacers() {
  const [topRacers, setTopRacers] = useState([]);
  const { t } = useTranslation();

  useEffect(() => {
    getApiCall("top-racers").then((response) => {
      if (response.status) {
        setTopRacers(response.data);
      }
    });
  }, []);
  return (
    <>
      <section id="racers" className="feature-section pt-50">
        <div className="container">
          <div className="row">
            <div className="col-xl-7 col-lg-8 mx-auto">
              <div className="section-title text-center mb-55">
                <h2 className="mb-20 wow fadeInUp" data-wow-delay=".2s">
                  {t("Our Top Racers")}
                </h2>
                <p className="wow fadeInUp" data-wow-delay=".4s">
                  {t("Here is the list of top racers.")}
                </p>
              </div>
            </div>
          </div>
          <div className="">
            <div className="row justify-content-center">
              <div className="col-xl-12 col-lg-12 col-md-12">
                <Table striped bordered hover>
                  <thead>
                    <tr>
                      <th>{t("Rank")}</th>
                      <th>{t("First Name")}</th>
                      <th>{t("Last Name")}</th>
                      <th>{t("Points")}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {topRacers.length > 0 ? (
                      topRacers.map((racer, index) => {
                        return (
                          <tr key={index}>
                            <td>{racer.rank}</td>
                            <td>{racer.first_name}</td>
                            <td>{racer.last_name}</td>
                            <td>{racer.rank}</td>
                          </tr>
                        );
                      })
                    ) : (
                      <tr>
                        <td colSpan={4}> {t("Loading data...")} </td>
                      </tr>
                    )}
                  </tbody>
                </Table>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
