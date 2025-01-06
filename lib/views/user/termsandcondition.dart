import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Terms and Conditions"),
        // ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions for ConsultDent",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. Introduction\n"
                "Welcome to our application ConsultDent. By accessing or using our App, you agree to be bound by the following terms and conditions (\"Terms\"). These Terms govern your use of the App, including but not limited to the posting of clinical cases, scheduling consultations, accessing e-books, and viewing clinical videos. If you do not agree with these Terms, please refrain from using the App.\n\n"
                "2. Eligibility\n"
                "The App is intended for licensed medical and dental professionals. By using the App, you confirm that you are a licensed practitioner in your respective field and have the necessary credentials to access and use the services provided.\n\n"
                "3. Clinical Case Submission\n"
                "• Responsibility: Doctors may post clinical cases, including medical history, X-rays, and clinical pictures. By posting, you confirm that you have obtained all necessary patient consents and have anonymized the data to protect patient identity.\n"
                "• Admin Review and Referral: Submitted cases will be reviewed by the App’s admin team before being referred to the relevant specialist consultant. The admin team reserves the right to reject any case that does not meet the required standards or lacks necessary details.\n"
                "• Specialist Input: While our consultants strive to provide accurate and practical treatment plans, the advice provided is based on the information submitted. The App is not liable for any misdiagnosis or complications arising from incomplete or inaccurate case details.\n\n"
                "4. Online Consultations\n"
                "• Scheduling: Doctors can schedule online consultations with specialist consultants via video call. This feature is subject to a service fee, payable at the time of booking.\n"
                "• Payment and Cancellation: All payments are non-refundable except in cases of technical failure or consultant unavailability. Cancellations must be made at least 24 hours in advance to reschedule without penalty.\n"
                "• Consultation Limitations: Consultations are advisory in nature. The App and its consultants are not liable for the outcomes of treatment plans implemented based on consultation advice.\n\n"
                "5. E-Book Library Access\n"
                "• Usage: The App provides access to a range of academic and clinical e-books. This feature is for educational purposes only and does not substitute professional training or advice.\n"
                "• Copyright Compliance: Users must not reproduce, distribute, or use the e-books for commercial purposes. Violation of copyright laws may result in suspension of access and legal action.\n\n"
                "6. Clinical Video Library\n"
                "• Content Access: Users can view clinical videos hosted on the Liaquat College of Medicine & Dentistry YouTube channel. These videos are designed for educational purposes and should not be used as a substitute for clinical training.\n"
                "• Disclaimer: The App is not responsible for any inaccuracies in the video content or any consequences resulting from reliance on these videos.\n\n"
                "7. User Responsibilities\n"
                "• Account Security: Users are responsible for maintaining the confidentiality of their login credentials. Any unauthorized access or use must be reported immediately.\n"
                "• Data Privacy: Users must handle patient data with utmost care, ensuring compliance with relevant privacy laws and obtaining necessary consents before uploading clinical cases.\n\n"
                "8. Intellectual Property\n"
                "All content, including text, graphics, logos, videos, and software, is the property of the App or its licensors. Unauthorized use, reproduction, or distribution of this content is strictly prohibited.\n\n"
                "9. Limitation of Liability\n"
                "The App and its affiliates, consultants, and administrators are not liable for:\n"
                "• Errors or omissions in treatment plans or educational content.\n"
                "• Losses or damages arising from the use of the App’s services.\n"
                "• Technical issues, including but not limited to server downtime or data breaches.\n\n"
                "10. Termination of Access\n"
                "The App reserves the right to suspend or terminate user access for violations of these Terms, misuse of services, or legal non-compliance.\n\n"
                "11. Amendments\n"
                "These Terms may be updated periodically. Users will be notified of significant changes, and continued use of the App constitutes acceptance of the updated Terms.\n\n"
                "12. Governing Law\n"
                "These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction]. Disputes arising under these Terms shall be subject to the exclusive jurisdiction of the courts in [Your Jurisdiction].\n\n"
                "13. Contact Information\n"
                "For questions or concerns regarding these Terms or the App’s services, please contact us at [Your Contact Email or Support Portal].\n\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Last updated: December 31, 2024",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
