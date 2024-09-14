
import 'package:bd_tour_firebase_admin/res/constant.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../widget/responsive.dart';
import 'widget/category_details_widget.dart';
import 'widget/dashboard_header_widget.dart';
import 'widget/my_popular_tour_list_widget.dart';
import 'widget/my_summery_widget.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ConstantData.defaultPadding),
        child: Column(
          children: [
            DashboardHeaderWidget(
              scaffoldKey: widget.scaffoldKey,
            ),
            const SizedBox(
              height: ConstantData.defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const MySummeryWidget(),
                        const SizedBox(height: ConstantData.defaultPadding),
                        const MyPopularTourWidget(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: ConstantData.defaultPadding),
                        if (Responsive.isMobile(context))
                          const CategoryDetailsWidget(),
                      ],
                    )),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: ConstantData.defaultPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(flex: 2, child: CategoryDetailsWidget())
              ],
            )
          ],
        ),
      ),
    );
  }
}



