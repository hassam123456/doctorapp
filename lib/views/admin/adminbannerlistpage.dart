import 'package:doctorapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerListPage extends StatefulWidget {
  @override
  State<BannerListPage> createState() => _BannerListPageState();
}

class _BannerListPageState extends State<BannerListPage> {
  final admincontroller = Get.put(AdminController(adminRepo: Get.find()));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      admincontroller.getbannerdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Banners"),
        ),
        body: Obx(() => admincontroller.bannerloading.value
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: const CircularProgressIndicator()),
              )
            : admincontroller.getbanner.value == null ||
                    admincontroller.getbanner.value!.data!.banners!.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(child: Text("No Top Banners")),
                  )
                : ListView.builder(
                    itemCount:
                        admincontroller.getbanner.value!.data.banners.length,
                    itemBuilder: (context, index) {
                      final banner =
                          admincontroller.getbanner.value!.data.banners[index];
                      return Card(
                        elevation: 3,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              banner.media?.isNotEmpty == true &&
                                      banner.media![0].originalUrl != null
                                  ? banner.media![0].originalUrl!
                                  : 'https://your-placeholder-image-url.com/placeholder.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // title: Text(banner ?? "No Title"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              print(banner.id);
                              admincontroller.deleteBanner(banner.id);
                              // _confirmDelete(context, banner.id);
                            },
                          ),
                        ),
                      );
                    },
                  )));
  }
}

void _confirmDelete(BuildContext context, String bannerId) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Delete Banner"),
        content: Text("Are you sure you want to delete this banner?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // AdminController.deleteBanner(bannerId);
              Navigator.of(context).pop();
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
