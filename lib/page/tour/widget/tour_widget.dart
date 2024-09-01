
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../controller/tour_controller.dart';
import '../../../model/tour_model.dart';
import 'button_widget.dart';

class TourWidget extends StatelessWidget {
  const TourWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final TourController tourController = Get.put(TourController());
    final tourModel = Provider.of<TourModel>(context);
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(20),
      color: const Color(0xFF2F3143),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: FancyShimmerImage(
                  imageUrl: tourModel.imageList![0],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  boxFit: BoxFit.fill,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    tourModel.name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w800,
                    ),
                    softWrap: true,
                    // Ensures text wraps to a new line
                    maxLines: 2,
                    // Limits to 2 lines, or you can adjust as needed
                    overflow: TextOverflow
                        .ellipsis, // Adds ... if text is longer than maxLines
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              tourModel.address!,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              tourModel.details!,
              maxLines: 3,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 1,
              color: Colors.white60,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                DeleteButtonWidget(
                  function: () {


                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Are you Want to delete"),
                          content: Text("Do you"),
                          actions: [
                            TextButton(onPressed: () {
                              tourController.deleteTour(id: tourModel.id!);
                              Navigator.pop(context);
                            }, child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No"))
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.blueAccent,
                  title: "Delete",
                  borderColor: Colors.blueAccent,
                  textColor: Colors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
                DeleteButtonWidget(
                  function: () {
                    var data = {
                      "isUdpate": true,
                      "tourModel":tourModel
                    };
                    context.goNamed("addScreen", extra: data);
                  },
                  backgroundColor: Color(0xFF2F3143),
                  title: "Edit",
                  borderColor: Colors.blueAccent,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
