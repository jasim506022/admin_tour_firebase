



import 'package:bd_tour_firebase_admin/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pie_chart/pie_chart.dart';

import '../controller/main_page_controller.dart';
import '../widget/dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final MainPageController controller = Get.put(MainPageController());

  final ImagePicker _picker = ImagePicker();
  /*
  Future<void> _uploadImage() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // User canceled the picker
      return;
    }

    // Convert XFile to a Blob for Flutter web
   var htmlFile = html.File(image.readAsBytesSync(), image.name);

    if (htmlFile == null) {
      return;
    }

    // Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref().child("images/${image.name}");

    // Upload the file
    try {
      await storageRef.putBlob(htmlFile);
      final downloadURL = await storageRef.getDownloadURL();
      print("Image uploaded successfully! URL: $downloadURL");
    } catch (e) {
      print("Failed to upload image: $e");
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Text("DashBoard",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.5)),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: secondaryColor,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        padding: const EdgeInsets.all(defaultPadding * 0.75),
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    )),
              )),
              Container(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    border: Border.all(color: Colors.white10),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "asset/image/image.jpg",
                            fit: BoxFit.fill,
                          ),
                        )

                        // child: Image.asset("asset/image/image.jpg"),
                        ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text("Md Jasim Uddin"),
                    ),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Files",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              print("Bangladesh");
                              // controller.onChangeState(
                              //     currentState: MainPageState.addTour);
                              FirebaseFirestore.instance
                                  .collection("example")
                                  .doc("Bangla")
                                  .set({"Dhaka": "Bangladesh"});
                              print("Successfully");
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5,
                                    vertical: defaultPadding)),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Add New",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      GridView.builder(
                        itemCount: demoMyFiles.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding,
                            childAspectRatio:
                                MediaQuery.of(context).size.width < 1400
                                    ? 1.1
                                    : 1.4),
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: const BoxDecoration(
                              color: secondaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                        defaultPadding * 0.75),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: demoMyFiles[index]
                                            .color!
                                            .withOpacity(0.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Icon(demoMyFiles[index].icon!),
                                  ),
                                  const Icon(Icons.more_vert,
                                      color: Colors.white54)
                                ],
                              ),
                              Text(demoMyFiles[index].title!),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: demoMyFiles[index]
                                            .color!
                                            .withOpacity(0.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) =>
                                        Container(
                                      width: constraints.maxWidth *
                                          (demoMyFiles[index].percentage! /
                                              100),
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: demoMyFiles[index].color,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${demoMyFiles[index].numOfFiles} Files",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white70),
                                  ),
                                  Text(
                                    demoMyFiles[index].totalStorage!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Files",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                  columnSpacing: defaultPadding,
                                  columns: const [
                                    DataColumn(
                                      label: Text("File Name"),
                                    ),
                                    DataColumn(
                                      label: Text("Date"),
                                    ),
                                    DataColumn(
                                      label: Text("Size"),
                                    ),
                                  ],
                                  rows: List.generate(
                                      demoRecentFiles.length,
                                      (index) => DataRow(cells: [
                                            DataCell(
                                              Row(
                                                children: [
                                                  Icon(
                                                    demoRecentFiles[index].icon,
                                                    size: 30,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                            defaultPadding),
                                                    child: Text(
                                                        demoRecentFiles[index]
                                                            .title!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DataCell(Text(
                                                demoRecentFiles[index].date!)),
                                            DataCell(Text(
                                                demoRecentFiles[index].size!)),
                                          ]))),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Storage Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: defaultPadding),
                        SizedBox(
                            height: 200,
                            child: PieChart(
                              chartType: ChartType.disc,
                              dataMap: dataMap,
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(0.15),
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(defaultPadding))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Title",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "15 Files",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text("15 GB")
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(0.15),
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(defaultPadding))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Title",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "15 Files",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text("15 GB")
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(0.15),
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(defaultPadding))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Title",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "15 Files",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text("15 GB")
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(0.15),
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(defaultPadding))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Title",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "15 Files",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text("15 GB")
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}

class CloudStorageInfo {
  final String title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;
  final IconData icon;

  CloudStorageInfo({
    required this.icon,
    required this.title,
    required this.totalStorage,
    required this.numOfFiles,
    required this.percentage,
    required this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 1328,
    icon: Icons.person,
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numOfFiles: 1328,
    icon: Icons.person,
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numOfFiles: 1328,
    icon: Icons.person,
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    icon: Icons.person,
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];

class RecentFile {
  final IconData? icon;
  final String? title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    icon: Icons.person,
    title: "XD File",
    date: "01-03-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Figma File",
    date: "27-02-2021",
    size: "19.0mb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Document",
    date: "23-02-2021",
    size: "32.5mb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Sound File",
    date: "21-02-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Media File",
    date: "23-02-2021",
    size: "2.5gb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Sales PDF",
    date: "25-02-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: Icons.person,
    title: "Excel File",
    date: "25-02-2021",
    size: "34.5mb",
  ),
];
