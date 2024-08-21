import 'dart:async';
import 'dart:io';

import 'package:bd_tour_firebase_admin/controller/add_tour_controller.dart';
import 'package:bd_tour_firebase_admin/page/mainpage.dart';
import 'package:bd_tour_firebase_admin/page/textfieldformwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../const/const.dart';
import '../const/gobalcolor.dart';
import '../page/textform_title_widget.dart';
import '../res/assets/animation_assets.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  var controllers = Get.put(AddTourController());

  // TextEditingController titleController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController detailsController = TextEditingController();
  // TextEditingController priceController = TextEditingController();
  // TextEditingController ratingController = TextEditingController();

  // final ImagePicker picker = ImagePicker();

  // List<Uint8List?> image = [];

  File? images;

  List<dynamic> list = [];

  String? selectedValue;
  List<XFile?> imageXFileList =[];

  @override
  void initState() {
    // TODO: implement initState
    var firestore = FirebaseFirestore.instance.collection("categories");
    firestore.doc("category").get().then(
      (value) {
        print(value.data()!["cateoris"]);
        list = value.data()!["cateoris"];
        print(list.length);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Decoration the text beautiful
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Add New Tour",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () {
                if (controllers.imageXFileList.isEmpty) {
                  // What is different between image.length == 0 & image.isEmpty
                  return Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)));
                } else if (controllers.imageXFileList.length <= 4) {
                  return Container(
                    height: 190,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5),
                      itemCount: controllers.imageXFileList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.white54, width: 2)),
                                height: 180,
                                margin: const EdgeInsets.all(15),
                                width: 180,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      File(controllers.imageXFileList[index]!.path).path,
                                      fit: BoxFit.fill),
                                )),
                            InkWell(
                              onTap: () {
                                controllers.imageXFileList.removeAt(index);
                                setState(() {});
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                height: 30,
                                width: 30,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 280,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5),
                      itemCount: controllers.imageXFileList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.white54, width: 2)),
                                height: 180,
                                margin: const EdgeInsets.all(15),
                                width: 180,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      File(controllers.imageXFileList[index]!.path).path,
                                      fit: BoxFit.fill),
                                )),
                            InkWell(
                              onTap: () {
                                controllers.imageXFileList.removeAt(index);
                                setState(() {});
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                height: 30,
                                width: 30,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),



            const SizedBox(
              height: 15,
            ),





            ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.deepGreen)),
                onPressed: () async {
                  controllers.captureImageFrom();
                  // var pickedFile = await picker.pickMultiImage();
                  //
                  // if (kIsWeb) {
                  //   for (var im in pickedFile) {
                  //     image.add(await im.readAsBytes());
                  //   }
                  //
                  //   setState(() {});
                  // }
                },
                child: const Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.white),
                )),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                borderRadius: BorderRadius.circular(15),
                hint: const Text("Select Tour Category"),
                value: selectedValue,
                items: list.map(
                  (e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  selectedValue = value.toString();
                  if (kDebugMode) {
                    print(selectedValue);
                  }
                  setState(() {});
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextFormTitleWidget(
              title: 'Title',
              textFieldWidget: TextFieldFormWidget(
                hintText: "Enter Tour Title",
                controller: controllers.titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title Must be fill-up";
                  }
                  return null;
                },
              ),
            ),
            TextFormTitleWidget(
              title: 'Price',
              textFieldWidget: TextFieldFormWidget(
                hintText: "Price",
                textInputType: TextInputType.number,
                controller: controllers.priceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title Must be fill-up";
                  }
                  return null;
                },
              ),
            ),
            TextFormTitleWidget(
              title: 'Rating',
              textFieldWidget: TextFieldFormWidget(
                hintText: "Rating",
                controller: controllers.ratingController,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title Must be fill-up";
                  }
                  return null;
                },
              ),
            ),
            TextFormTitleWidget(
              title: 'Address',
              textFieldWidget: TextFieldFormWidget(
                hintText: "Address",
                controller: controllers.addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title Must be fill-up";
                  }
                  return null;
                },
              ),
            ),
            TextFormTitleWidget(
              title: 'Details',
              textFieldWidget: TextFieldFormWidget(
                hintText: "Details",
                maxLines: 8,
                controller: controllers.detailsController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title Must be fill-up";
                  }
                  return null;
                },
              ),
            ),

            TextButton(onPressed: () {
              controllers.imageUploadedUrl();
            }, child: Text("Upload Data")),

            ElevatedButton(
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                  backgroundColor: WidgetStatePropertyAll(AppColors.deepGreen)),
              onPressed: () async {
                // final uniqueImageName =
                // DateTime
                //     .now()
                //     .millisecondsSinceEpoch
                //     .toString();
                //
                //
                // List<String> imageUrl = [];

                // globalMethod.showMyDialog(
                //   title: "New Tour Uploading\n Pleasing Waiting........",
                //   animationAssets: AnimationAssets.loadingAnimation,
                //   context: context,
                //   barrierDismissible: false,
                // );

                //
                // Future.delayed(
                //   Duration(seconds: 5),
                //   () {
                //
                //   },
                // );

                // Timer(Duration(seconds: 1), ()  {
                //
                //   globalMethod.showMyDialog(
                //     title: "Pleasing Waiting........",
                //     animationAssets: AnimationAssets.loadingAnimation,
                //     context: context,
                //     barrierDismissible: false,
                //   );
                // });

                // globalMethod.errorDialog(
                //   barrierDismissible: false,
                //   animationAssets: AnimationAssets.loadingAnimation,
                //   title: " New Tour Uploading\n Pleasing Waiting........",
                // );

                controllers.uploadNewTour(
                    selectedValue: selectedValue ?? "Museum", context: context);
/*
                for (var element in image) {
                  final storageRef = FirebaseStorage.instance.ref();
                  final mountainsRef =
                  storageRef.child("tour_picture/$uniqueImageName");

                  UploadTask task = mountainsRef.putData(element!);
                  await task.whenComplete(() async {
                    imageUrl.add(await mountainsRef.getDownloadURL());
                  });
                }

                FirebaseFirestore firestore = FirebaseFirestore.instance;

                TourModel tourModel = TourModel(
                    category: selectedValue,
                    name: controllers.titleController.text,
                    address:controllers. addressController.text,
                    details: controllers.detailsController.text,
                    imageList: imageUrl,
                    price: double.parse(controllers.priceController.text),
                    ratting: double.parse(controllers.ratingController.text),
                    id: uniqueImageName);

                firestore
                    .collection("tours")
                    .doc(uniqueImageName)
                    .set(tourModel.toMap());

 */

                // print("Succeffull Update");

                // Clear the images list after upload
                /*
                setState(() {
                  image.clear();
                });

                 */
              },
              child: Obx(() => controllers.loadingController.isLoading.value
                  ? CircularProgressIndicator()
                  : Text(
                      "Post Data to Firebase",
                      style: TextStyle(color: Colors.white),
                    )),
            )
          ],
        ),
      ),
    );
  }
}

/*
 if (image
                .isEmpty) // What is different between image.length == 0 & image.isEmpty
              Container(
                  height: 10,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)))
            else if (image.length <= 4)
              Container(
                height: 190,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5),
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.white54, width: 2)),
                            height: 180,
                            margin: const EdgeInsets.all(15),
                            width: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                                  Image.memory(image[index]!, fit: BoxFit.fill),
                            )),
                        InkWell(
                          onTap: () {
                            image.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            height: 30,
                            width: 30,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                height: 280,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5),
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.white54, width: 2)),
                            height: 180,
                            margin: const EdgeInsets.all(15),
                            width: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                                  Image.memory(image[index]!, fit: BoxFit.fill),
                            )),
                        InkWell(
                          onTap: () {
                            image.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            height: 30,
                            width: 30,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
 */
