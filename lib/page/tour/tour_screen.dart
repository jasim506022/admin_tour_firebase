
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controller/tour_controller.dart';
import '../../model/tour_model.dart';
import 'widget/loading_tour_widget.dart';
import 'widget/tour_widget.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({super.key});


  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  final TourController tourController = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: tourController.tourSnapshot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.builder(
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: .76),
            itemBuilder: (context, index) {
              return const LoadingTourWidget();
            },
          );
        }
        if (snapshot.hasError) {
          return Stack(
            children: [
              Center(child: Image.asset("asset/image/errorimage.png")),
              const Positioned(
                left: 470,
                top: 150,
                right: 300,
                child: Text(
                  "Hi I am From Bangla Desh Waht are you doing Hi I am From Bangla Desh Waht are you doing ",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Stack(
            children: [
              Center(child: Image.asset("asset/image/errorimage.png")),
              const Positioned(
                left: 470,
                top: 150,
                right: 300,
                child: Text(
                  "Hi I am From Bangla Desh Waht are you doing Hi I am From Bangla Desh Waht are you doing ",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          );
        }
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: .76),
            itemBuilder: (context, index) {
              TourModel tourModel =
                  TourModel.fromMap(snapshot.data!.docs[index].data());

              return ChangeNotifierProvider.value(
                  value: tourModel, child: TourWidget(index: index));


            },
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: .76),
          itemBuilder: (context, index) {
            return const LoadingTourWidget();

          },
        );

      },
    ));
  }
}
