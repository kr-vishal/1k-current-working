import './constants.dart';
// ignore: library_prefixes
import 'package:flutter/foundation.dart' as Foundation;

String authToken = (Foundation.kReleaseMode)
    ? "Xi7dkFUtZts5jf5jxwMinxNniswr4MHR7AzXKKM1qVEPn8r8gCYUm9TkcBGbWoyD"
    : "i9dFpfepLaDZX3mA1WCwYAdz3HcAlI9IZv1E9qSHtK4pNhuRVrsdg1WfYi3LE1nR";

String baseUrl = (Foundation.kReleaseMode)
    ? "https://telecare.healthians.com/api/"
    : "http://football.test/api/";

String baseApiUrl = (Foundation.kReleaseMode)
    ? "https://api.healthians.com"
    : "https://d5api.healthians.co.in";

String baseUrlCRM = (Foundation.kReleaseMode)
    ? "https://crmapi.healthians.com"
    : "https://d9crm.healthians.co.in";

String hpaBaseUrl = (Foundation.kReleaseMode)
    ? "https://crmapi.healthians.com/v2/"
    : "https://t5api.healthians.co.in/v2/";

String dateFormat = "dd MMM yyyy";

/* String authToken =
    "Xi7dkFUtZts5jf5jxwMinxNniswr4MHR7AzXKKM1qVEPn8r8gCYUm9TkcBGbWoyD";
String baseUrl = "https://telecare.healthians.com/api";
String baseUrlCRM = "https://crmapi.healthians.com";
String baseApiUrl = "https://api.healthians.com"; */

//String hpaBaseUrl = "https://t5api.healthians.co.in/v2/";

String teleConsultation =
    "/teleconsultation/teleconsultation/getTeleCareDoctorCustomerSession";
String profileUrl = "/getDoctorProfile";
String upcomingConsult = "/doctorUpcomingConsultation";
String generateOtp = "/generateUserOtp";
String otpByCall = "/generateOtpOnCall";
String verifyOtpEnd = "/verifyOtp";
String refreshTokenEnd = "/refreshToken";
String consultHistory = "/doctorConsultationHistory";
String consultDone = "/doctorConsultationDone";
String prescriptionNotes = "/prescriptionDetail";
String savePrescription = "/savePrescription";
String timeValidation = "/consultationTimeValidation";
String basicInfo = "/getBasicData";
String consultByCall = "/consultationByCall";
String bookingCancelReasons = "/cancelConsultationReason";
String cancelBooking = "/cancelConsultation";
String consultationDetail = "/consultationDetail";
String custUpcomingConsult = "/customerUpcomingConsultation";
String custConsultHistory = "/customerConsultHistory";
String modulePermission = "/getUserPermissions";

String apiBaseUrl = "$baseApiUrl/eagle/v1/eagle";
String apiProductSuggestion =
    "/getProductSuggestion?resource_type=consumer_app&app_version=$docsAppVersion&keyword=";

String checkUpdate = "/phlebos_rest_api/get_app_version";
String labTestApi = "$baseUrl/getTestList";