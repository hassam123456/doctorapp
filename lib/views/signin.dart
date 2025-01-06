// import 'package:doctorapp/constants/routeconstants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SigninPage extends StatelessWidget {
//   const SigninPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Doctor App'),
//       //   backgroundColor: Colors.green,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Welcome to ConsultDent by LCMD👋',
//                 style: TextStyle(
//                   fontSize: 15,
//                   // fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 22),
//               Image.asset(
//                 'assets/images/doctorsplashpic.png', // Replace with your image URL
//                 height: 350,
//                 width: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(height: 20),
//               Wrap(
//                 spacing: 10, // Horizontal spacing between the buttons
//                 runSpacing: 10, // Vertical spacing between the rows
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.toNamed(RouteConstants.loginpage, arguments: "3");
//                       },
//                       child: _buildLoginOption(
//                           Icons.person, 'Login as Admin', Colors.green)),
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed(RouteConstants.loginpage, arguments: "2");
//                     },
//                     child: _buildLoginOption(Icons.local_hospital,
//                         'Login as Consultant', Colors.green),
//                   ),

//                   // Align the "Login as User" button in the center
//                   Align(
//                     alignment:
//                         Alignment.center, // Centers the button horizontally
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.toNamed(RouteConstants.loginpage, arguments: "1");
//                       },
//                       child: _buildLoginOption(
//                           Icons.people, 'Login as User', Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // GestureDetector(
//               //   onTap: () {
//               //     Get.toNamed(RouteConstants.signuppage);
//               //   },
//               //   child: Text(
//               //     "Don't have an account? Signup",
//               //     style: TextStyle(color: Colors.blue),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginOption(IconData icon, String text, Color color) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: color),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 40, color: color),
//             SizedBox(height: 10),
//             Text(
//               text,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
