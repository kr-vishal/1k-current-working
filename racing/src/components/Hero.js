import React from "react";
import { useTranslation } from "react-i18next";

export default function Hero() {
  const { t } = useTranslation();

  return (
    <section id="home" className="hero-section">
      {/* <div className="shapes">
          <div className="shape shape-1"></div>
          <div className="shape shape-2"></div>
          <div className="shape shape-3"></div>
        </div> */}
      <div className="container">
        <div className="row align-items-center">
          <div className="col-xl-7 col-lg-7">
            <div className="hero-content-wrapper">
              <h2 className="text-white wow fadeInDown" data-wow-delay=".2s">
                {t("title")}
              </h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
