import React, { useEffect } from "react";
import logo from "../assets/img/logo.svg";
import { useTranslation } from "react-i18next";
import Language from "./Language";

export default function Header({ hideMenu = false }) {
  const { t, i18n } = useTranslation();

  useEffect(() => {
    document.documentElement.lang = i18n.language;
  }, []);
  return (
    <>
      <header className="header navbar-area">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <nav className="navbar navbar-expand-lg">
                <a className="navbar-brand" href="/">
                  <img src={logo} alt="Logo" width={150} height={40} />
                </a>
                <button
                  className="navbar-toggler"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
                >
                  <span className="toggler-icon"></span>
                  <span className="toggler-icon"></span>
                  <span className="toggler-icon"></span>
                </button>

                <div
                  className="collapse navbar-collapse sub-menu-bar"
                  id="navbarSupportedContent"
                >
                  <ul id="nav" className="navbar-nav ml-auto">
                    {!hideMenu && (
                      <>
                        <li className="nav-item">
                          <a className="page-scroll active" href="#home">
                            {t("Home")}
                          </a>
                        </li>
                        <li className="nav-item">
                          <a className="page-scroll" href="#fixtures">
                            {t("Fixtures")}
                          </a>
                        </li>
                        <li className="nav-item">
                          <a className="page-scroll" href="#racers">
                            {t("Top Racers")}
                          </a>
                        </li>
                        <li className="nav-item">
                          <a className="page-scroll" href="#contact">
                            {t("Contact Us")}
                          </a>
                        </li>
                      </>
                    )}
                    <li className="nav-item pt-15">
                      <Language />
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </header>
    </>
  );
}
