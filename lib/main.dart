import 'package:doctorapp/constants/app_binding.dart';
import 'package:doctorapp/constants/routeconstants.dart';
import 'package:doctorapp/constants/routemanagment.dart';
import 'package:doctorapp/controller/componentsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (buildContext, orientation, screenType) {
        return GetBuilder(
            init: ComponentsController(),
            builder: (controller) {
              return GetMaterialApp(
                  initialBinding: AppBindings(),
                  debugShowCheckedModeBanner: false,
                  title: 'DoctorsApp',
                  defaultTransition: Transition.cupertino,
                  getPages: Routes.getpages(),
                  initialRoute: RouteConstants.splashscreen);
            });
      },
    );
  }
}
