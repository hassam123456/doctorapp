import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantsListPage extends StatefulWidget {
  // final ConsultantController consultantController;

  ConsultantsListPage();

  @override
  State<ConsultantsListPage> createState() => _ConsultantsListPageState();
}

class _ConsultantsListPageState extends State<ConsultantsListPage> {
  final consultantController = Get.put(AdminController(adminRepo: Get.find()));

  @override
  void initState() {
    super.initState();
    consultantController.getconsultantlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Consultants",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        if (consultantController.consultantlistloading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (consultantController.consultantlist.value!.data!.doctors!.isEmpty) {
          return Center(child: Text("No consultants available"));
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount:
              consultantController.consultantlist.value!.data!.doctors!.length,
          itemBuilder: (context, index) {
            final consultant = consultantController
                .consultantlist.value!.data!.doctors![index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    (consultant.media == null ||
                            consultant.media!.isEmpty ||
                            consultant.media![0].originalUrl == null ||
                            consultant.media![0].originalUrl!.isEmpty)
                        ? AppConstants.noimage
                        : consultant.media![0].originalUrl.toString(),
                  ),
                  radius: 30,
                ),
                title: Text(
                  consultant.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff334A853),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${4} Active Cases'),
                    Text('Specialty: ${consultant.specialization}'),
                    Text('Hospital: ${consultant.hospitalName}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
