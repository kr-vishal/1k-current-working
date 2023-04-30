import React, { useRef, useState } from "react";
import { postApiCall } from "../utils/constants";
import { Alert } from "react-bootstrap";
import { useTranslation } from "react-i18next";

export default function Contact() {
  const [show, setShow] = useState(false);
  const { t } = useTranslation();

  const inputName = useRef(null);
  const inputEmail = useRef(null);
  const inputPhone = useRef(null);
  const inputSubject = useRef(null);
  const inputMessage = useRef(null);

  const onSubmitHandler = async (event) => {
    const responseBody = {};

    event.preventDefault();
    responseBody.name = inputName.current.value;
    responseBody.email = inputEmail.current.value;
    responseBody.phone = inputPhone.current.value;
    responseBody.subject = inputSubject.current.value;
    responseBody.message = inputMessage.current.value;

    postApiCall("submit-contact", responseBody).then((response) => {
      setShow(true);

      setTimeout(function () {
        setShow(false);
      }, 3000);
    });
    //Form submission happens here
  };

  return (
    <section id="contact" className="contact-section pt-120 pb-105">
      <div className="container">
        <div className="row align-items-end">
          <div className="col-xl-12 col-lg-12">
            <div className="contact-wrapper mb-30">
              <h2 className="mb-20 wow fadeInDown" data-wow-delay=".2s">
                {t("Contact US")}
              </h2>
              <p className="mb-55 wow fadeInUp" data-wow-delay=".4s">
                {t("We would be happy to help you with any query you have.")}
              </p>
              {show && (
                <Alert
                  variant="success"
                  onClose={() => setShow(false)}
                  dismissible
                >
                  <Alert.Heading>
                    {t(
                      "You request has been submitted, and we will get back to you soon !!"
                    )}
                  </Alert.Heading>
                </Alert>
              )}
              <form
                onSubmit={onSubmitHandler}
                id="contact-form"
                className="contact-form"
              >
                <div className="row">
                  <div className="col-lg-6 col-md-6">
                    <input
                      type="text"
                      id="name"
                      name="name"
                      placeholder={t("Name*")}
                      required="required"
                      ref={inputName}
                    />
                  </div>
                  <div className="col-lg-6 col-md-6">
                    <input
                      type="email"
                      id="email"
                      name="email"
                      placeholder={t("Email*")}
                      required="required"
                      ref={inputEmail}
                    />
                  </div>
                  <div className="col-lg-6 col-md-6">
                    <input
                      type="text"
                      id="phone"
                      name="phone"
                      placeholder={t("Phone*")}
                      ref={inputPhone}
                    />
                  </div>
                  <div className="col-lg-6 col-md-6">
                    <input
                      type="text"
                      id="subject"
                      name="subject"
                      placeholder={t("Subject*")}
                      required="required"
                      ref={inputSubject}
                    />
                  </div>
                  <div className="col-lg-12">
                    <textarea
                      name="message"
                      id="message"
                      rows="5"
                      placeholder={t("Message*")}
                      required="required"
                      ref={inputMessage}
                    ></textarea>
                  </div>
                </div>
                <button type="submit" className="theme-btn theme-btn-2">
                  {t("SEND MESSAGE")}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
