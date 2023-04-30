import { useState } from "react";
import Dropdown from "react-bootstrap/Dropdown";
import DropdownButton from "react-bootstrap/DropdownButton";
import { useTranslation } from "react-i18next";

function Language() {
  const [language, setLanguage] = useState("en-GB");

  const { t, i18n } = useTranslation();
  const changeLanguage = (lang) => {
    i18n.changeLanguage(lang);
    setLanguage(i18n.language);
    console.log(language);
    document.documentElement.lang = lang;
  };

  return (
    <DropdownButton id="dropdown-basic-button" title="Languages" size="sm">
      {i18n.language !== "en-GB" && (
        <Dropdown.Item
          onClick={() => {
            changeLanguage("en-GB");
          }}
        >
          {t("English")}
        </Dropdown.Item>
      )}
      {i18n.language !== "de" && (
        <Dropdown.Item
          onClick={() => {
            changeLanguage("de");
          }}
        >
          {t("German")}
        </Dropdown.Item>
      )}
    </DropdownButton>
  );
}

export default Language;
