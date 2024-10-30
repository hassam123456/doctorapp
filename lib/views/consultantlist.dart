import 'package:flutter/material.dart';

class ConsultantListPage extends StatelessWidget {
  void showConsultantListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return ConsultantListBottomSheet(scrollController: scrollController);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showConsultantListBottomSheet(context),
          child: Text('Show Consultant List'),
        ),
      ),
    );
  }
}

class ConsultantListBottomSheet extends StatefulWidget {
  final ScrollController scrollController;

  ConsultantListBottomSheet({required this.scrollController});

  @override
  _ConsultantListBottomSheetState createState() =>
      _ConsultantListBottomSheetState();
}

class _ConsultantListBottomSheetState extends State<ConsultantListBottomSheet> {
  int? selectedDoctorIndex;

  void _showConfirmationDialog(String doctorName) {
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
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              print("Case assigned to $doctorName");
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                final doctor = doctorList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(doctor['image']!),
                      radius: 30,
                    ),
                    title: Text(
                      doctor['name']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff334A853)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${doctor['cases']} Active Cases'),
                        Text('Specialty: ${doctor['specialty']}'),
                        Text('Hospital: ${doctor['hospital']}'),
                      ],
                    ),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: selectedDoctorIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedDoctorIndex = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: selectedDoctorIndex != null
                ? () => _showConfirmationDialog(
                    doctorList[selectedDoctorIndex!]['name']!)
                : null,
            child: Text('Assign'),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> doctorList = [
  {
    'name': 'Dr. Sarah Thompson',
    'cases': '3',
    'specialty': 'Obstetrician/Gynecologist',
    'hospital': 'Cityville General Hospital',
    'image': 'assets/images/consultant1.png',
  },
  {
    'name': 'Dr. Mark Johnson',
    'cases': '2',
    'specialty': 'Urologist',
    'hospital': 'Westfield Memorial Hospital',
    'image': 'assets/images/consultant2.png',
  },
  {
    'name': 'Dr. Jessica Lee',
    'cases': '1',
    'specialty': 'Gastroenterologist',
    'hospital': 'Green Valley Medical Center',
    'image': 'assets/images/consultant3.png',
  },
  {
    'name': 'Dr. Kevin Martinez',
    'cases': '0',
    'specialty': 'Neurologist',
    'hospital': 'Pinnacle Health Institute',
    'image': 'assets/images/consultant4.png',
  },
];
