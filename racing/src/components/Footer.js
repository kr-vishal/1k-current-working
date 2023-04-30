import React from "react";
import { useTranslation } from "react-i18next";

export default function Footer() {
  const { t } = useTranslation();

  return (
    <footer className="footer pt-100 img-bg gradient">
      <div className="container">
        <div className="row">
          <div className="col-xl-4 col-lg-4 col-md-6">
            <div
              className="footer-widget mb-60 wow fadeInLeft"
              data-wow-delay=".2s"
            >
              <a href="index.html" className="logo mb-40" aria-label="Logo">
                <img src="assets/img/logo.svg" alt="" />
              </a>
              <p className="mb-30">{t("Lorem ipsum dolor sit amet")}</p>
              <div className="footer-social-links">
                <ul>
                  <li>
                    <a
                      href="https://facebook.com"
                      aria-label="Facebook link"
                      target="_blank"
                      rel="noreferrer"
                    >
                      <i className="lni lni-facebook-filled"></i>
                    </a>
                  </li>
                  <li>
                    <a
                      href="https://twitter.com"
                      aria-label="Twitter page link"
                      target="_blank"
                      rel="noreferrer"
                    >
                      <i className="lni lni-twitter-filled"></i>
                    </a>
                  </li>
                  <li>
                    <a
                      href="https://linkedin.com"
                      aria-label="LinkedIn page link"
                      target="_blank"
                      rel="noreferrer"
                    >
                      <i className="lni lni-linkedin-original"></i>
                    </a>
                  </li>
                  <li>
                    <a
                      href="https://instagram.com"
                      aria-label="Instagram page link"
                      target="_blank"
                      rel="noreferrer"
                    >
                      <i className="lni lni-instagram-original"></i>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div className="col-xl-3 col-lg-3 col-md-6">
            <div
              className="footer-widget mb-60 wow fadeInUp"
              data-wow-delay=".4s"
            >
              <h4>{t("Company")}</h4>
              <ul className="footer-links">
                <li>
                  <a href="#home">{t("Home")}</a>
                </li>
                <li>
                  <a href="#fixtures">{t("Fixtures")}</a>
                </li>
                <li>
                  <a href="#racers">{t("Top Racers")}</a>
                </li>
                <li>
                  <a href="#contact">{t("Contact Us")}</a>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-xl-4 col-lg-4 col-md-6">
            <div
              className="footer-widget mb-60 wow fadeInRight"
              data-wow-delay=".8s"
            >
              <h4>{t("Resource")}</h4>
              <ul>
                <li className="mb-30">
                  <p>
                    {t("Company No")}: C5B345 <br />
                    CSINE GROUP LTD.
                  </p>
                </li>
                <li>
                  <p>
                    {t("Address")}: Sample Address, <br /> Next Line Address
                  </p>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
