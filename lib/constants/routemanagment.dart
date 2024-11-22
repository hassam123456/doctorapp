import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/views/admin/addconsultant_screen.dart';
import 'package:doctorapp/views/admin/adminalreadyassignedcasedetails_screen.dart';
import 'package:doctorapp/views/admin/admincaseconsult_screen.dart';
import 'package:doctorapp/views/admin/admincasedetails_screen.dart';
import 'package:doctorapp/views/admin/adminhomescreen.dart';
import 'package:doctorapp/views/admin/adminuploadeBookScreen.dart';
import 'package:doctorapp/views/admin/adminuploadvideoscreen.dart';
import 'package:doctorapp/views/casedetails_screen.dart';
import 'package:doctorapp/views/casedetails_screen2.dart';
import 'package:doctorapp/views/changepassword.dart';
import 'package:doctorapp/views/consultantlist.dart';
import 'package:doctorapp/views/doctor/doctorHomeScreen.dart';
import 'package:doctorapp/views/doctor/doctorbottomnavbar.dart';
import 'package:doctorapp/views/doctor/doctorcaseconsult_screen.dart';
import 'package:doctorapp/views/doctor/doctorprofile_screen.dart';
import 'package:doctorapp/views/doctor/doctoruploadtreatmentplan_screen.dart';
import 'package:doctorapp/views/ebookscreen.dart';
import 'package:doctorapp/views/emailverificationscreen.dart';
import 'package:doctorapp/views/forgotpasswordscreen.dart';
import 'package:doctorapp/views/loginscreen.dart';
import 'package:doctorapp/views/notifcationscreen.dart';
import 'package:doctorapp/views/profilescreen.dart';
import 'package:doctorapp/views/signupscreen.dart';
import 'package:doctorapp/views/signin.dart';
import 'package:doctorapp/views/user/forgotemailverification.dart';
import 'package:doctorapp/views/user/userbottomnavbar.dart';
import 'package:doctorapp/views/user/usercaseconsult_screen.dart';
import 'package:doctorapp/views/user/userhomescreen.dart';
import 'package:doctorapp/views/user/useruploadcase_screen.dart';
import 'package:doctorapp/views/videobookscreen.dart';
import 'package:doctorapp/views/welcomescreen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> getpages() {
    return [
      GetPage(
          name: RouteConstants.casedetails, page: () => CaseDetailsScreen()),
      GetPage(name: RouteConstants.userhome, page: () => UserHomeScreen()),
      GetPage(
          name: RouteConstants.doctorhomescreen,
          page: () => DoctorHomeScreen()),
      GetPage(
          name: RouteConstants.adminhomescreen, page: () => AdminHomeScreen()),
      GetPage(
          name: RouteConstants.addconsultantscreen,
          page: () => AddConsutltantScreen()),
      GetPage(
          name: RouteConstants.usercaseconsultscreen,
          page: () => UserCaseConsultScreen()),
      GetPage(
          name: RouteConstants.useruploadcasescreen,
          page: () => UserUploadCaseScreen()),
      GetPage(
          name: RouteConstants.doctorbottomnavbar,
          page: () => DoctorBottomNavBar()),
      GetPage(
          name: RouteConstants.userbottomnavbar,
          page: () => UserBottomNavBar()),
      GetPage(
          name: RouteConstants.adminuploadvideoScreen,
          page: () => AdminUploadVideoScreen()),
      GetPage(
          name: RouteConstants.admincaseconsultscreen,
          page: () => AdminCaseConsultScreen()),
      GetPage(
          name: RouteConstants.adminuploadebookScreen,
          page: () => AdminUploadEBookScreen()),
      GetPage(
          name: RouteConstants.doctorprofilescreen,
          page: () => DoctorProfileScreen()),
      GetPage(
          name: RouteConstants.admincasedetailscreen,
          page: () => AdminCaseDetailScreen()),
      GetPage(
          name: RouteConstants.adminassignedcasedetailscreen,
          page: () => AdminAssignedCaseDetailScreen()),
      GetPage(
          name: RouteConstants.doctoruploadtreatmentscreen,
          page: () => DoctorUploadTreatmentScreen()),
      GetPage(
          name: RouteConstants.doctorcaseconsultscreen,
          page: () => DoctorCaseConsultScreen()),

      ///////hassam screens,
      GetPage(name: RouteConstants.splashscreen, page: () => SigninPage()),
      GetPage(
          name: RouteConstants.notificationscreen,
          page: () => NotificationScreen()),
      GetPage(
          name: RouteConstants.consultantlistscreen,
          page: () => ConsultantListPage()),
      GetPage(
          name: RouteConstants.kcasedetails2, page: () => CaseDetailsScreen2()),
      GetPage(name: RouteConstants.loginpage, page: () => LoginPage()),
      GetPage(name: RouteConstants.signuppage, page: () => SignupPage()),
      GetPage(
          name: RouteConstants.forgotpage, page: () => ForgetPasswordPage()),
      GetPage(
          name: RouteConstants.emailverification,
          page: () => EmailVerificationScreen()),
      GetPage(
          name: RouteConstants.forgotemailverification,
          page: () => ForgotEmailVerificationScreen()),
      GetPage(
          name: RouteConstants.changepassword, page: () => ChangePassword()),
      GetPage(name: RouteConstants.welcomescreen, page: () => WelcomeScreen()),
      GetPage(name: RouteConstants.ebookscreen, page: () => EBookListScreen()),
      GetPage(name: RouteConstants.videoscreen, page: () => VideoBookScreen()),
      GetPage(name: RouteConstants.profilescreen, page: () => ProfileScreen()),
    ];
  }
}
