import 'package:doctorapp/constants/appconstant.dart';
import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantListPage extends StatelessWidget {
  // void showConsultantListBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  //     ),
  //     isScrollControlled: true,
  //     builder: (context) => DraggableScrollableSheet(
  //       initialChildSize: 0.5,
  //       minChildSize: 0.3,
  //       maxChildSize: 0.9,
  //       expand: false,
  //       builder: (context, scrollController) {
  //         return ConsultantListBottomSheet(scrollController: scrollController);
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
// showConsultantListBottomSheet(context)
          },
          child: Text('Show Consultant List'),
        ),
      ),
    );
  }
}

class ConsultantListBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  final String caseguid;

  ConsultantListBottomSheet(
      {required this.scrollController, required this.caseguid});

  @override
  _ConsultantListBottomSheetState createState() =>
      _ConsultantListBottomSheetState();
}

class _ConsultantListBottomSheetState extends State<ConsultantListBottomSheet> {
  int? selectedDoctorIndex;
  String? selectedDoctorname;
  // Show confirmation dialog when a doctor is selected for assignment
  void _showConfirmationDialog(String doctorName, VoidCallback yesontap) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are You Sure You Want To Assign This Case?'),
        content: Text('Assign this case to $doctorName?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: yesontap,
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  final consultantController = Get.put(AdminController(adminRepo: Get.find()));

  @override
  void initState() {
    super.initState();
    consultantController.getconsultantlist();
  }

  @override
  Widget build(BuildContext context) {
    // Get the ConsultantController instance

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Consultant List',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff334A853)),
          ),
          SizedBox(height: 8),
          Text(
            'You can assign specific cases to the most suitable consultant doctor based on their expertise.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Use Obx to observe changes in the consultants list
          Obx(() {
            if (consultantController.consultantlistloading.value) {
              return Center(child: CircularProgressIndicator());
            }

            // if (consultantController.errorMessage.isNotEmpty) {
            //   return Center(
            //       child: Text(consultantController.errorMessage.value));
            // }

            if (consultantController
                .consultantlist.value!.data!.doctors!.isEmpty) {
              return Center(child: Text("No consultants available"));
            }

            return Expanded(
              child: ListView.builder(
                controller: widget.scrollController,
                itemCount: consultantController
                    .consultantlist.value!.data!.doctors!.length,
                itemBuilder: (context, index) {
                  final consultant = consultantController
                      .consultantlist.value!.data!.doctors![index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          (consultant.media == null ||
                                  consultant.media!.isEmpty ||
                                  consultant.media![0].originalUrl == null ||
                                  consultant.media![0].originalUrl!.isEmpty)
                              ? AppConstants
                                  .noimage // Placeholder image for no media or empty URL
                              : consultant.media![0].originalUrl.toString(),
                        ),
                        radius: 30,
                      ),
                      title: Text(
                        consultant.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff334A853)),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${4} Active Cases'),
                          Text('Specialty: ${consultant.specialization}'),
                          Text('Hospital: ${consultant.hospitalName}'),
                        ],
                      ),
                      trailing: Radio<int>(
                        value: consultant.id ?? 0,
                        groupValue: selectedDoctorIndex,
                        onChanged: (int? value) {
                          setState(() {
                            selectedDoctorIndex = value;
                            selectedDoctorname = consultant.name ?? "";
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: selectedDoctorIndex != null
                ? () {
                    _showConfirmationDialog(selectedDoctorname ?? "", () {
                      consultantController.adminAssignCaseDoctor(
                          caseid: widget.caseguid,
                          doctorid: selectedDoctorIndex.toString());
                    });
                  }
                : null,
            child: Text('Assign'),
          ),
        ],
      ),
    );
  }
}
