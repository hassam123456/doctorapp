class AppConstants {
  static String apibaseurl = "https://doctor.themerchantinc.com/api/";
  static String signup = "auth/register";
  static String signupemailverification = "auth/verify-otp";
  static String resendotp = "auth/send-otp";
  static String admincreateEbook = "ebook/create";
  static String admincreatevideo = "video-library/create";
  static const login = "auth/login";
  static const verifyotp = "auth/verify-otp";
  static const sendotp = "auth/send-otp";
  static const ebook = "ebook";
  static const video = "video-library";
  static const caseadmin = "case/admin";
  static const doctorcase = "case/doctor";
  static const usercase = "case";
  static const consultantlist = "case/doctors";
  static const ebooksearch = "ebook/search?search_key=";
  static const videosearch = "video-library/get-by-id/";
  static const userupdateprofile = "user/profile-update";

  static const getprofile = "user/profile";

  static const getnotiifcationdata = "user/get-notification";
  static const noimage =
      "https://static.vecteezy.com/system/resources/thumbnails/022/014/063/small_2x/missing-picture-page-for-website-design-or-mobile-app-design-no-image-available-icon-vector.jpg";

  static const resetpassword = "auth/reset-password";
  static String admindeleteebook = "ebook/delete/";
  static String admindeletevideo = "video-library/delete/";
  static String useruploadCase = "case/create";
  static String useruploadcasedetails = "case/create-update-cvs/";
  static String adminaddconsultants = "case/register-doctor";

  static String admingetcasebyid = "case/get-by-id/";
  static String adminassigncase = "case/assign-doctor/";
  static String doctoruploadtreatment = "case/upload-treatment/";
}
