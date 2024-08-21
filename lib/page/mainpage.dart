import 'package:bd_tour_firebase_admin/controller/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../const/const.dart';
import '../res/routes/routers.dart';





class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final LoadingController controller = Get.put(LoadingController());
  // String selectString = SidebarItem.dashboardScreen.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Drawer(
              backgroundColor: secondaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DrawerHeader(child: Icon(Icons.save)),
                    Column(
                      children: SidebarItem.values.map((item) {
                        return Obx( () =>
                          ListTile(
                            onTap: () {
                              // Update the selected item in state

                              controller.setIndex(index: item.value);
                              // selectString = item.value;


                              // Navigate to the selected route
                              context.goNamed(item.name);
                            },
                            leading: Icon(
                              item.iconData,
                              color: controller.selectIndex.value == item.value
                                  ? Colors.yellow
                                  : Colors.white54,
                              size: 20,
                            ),
                            title: Text(
                              item.value,
                              style: TextStyle(
                                color: controller.selectIndex.value == item.value
                                    ? Colors.yellow
                                    : Colors.white54,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}


class TourModel with ChangeNotifier {
  String? name;
  String? address;
  String? details;
  double? price;
  double? ratting;
  List<String>? imageList;
  String? id;
  String? category;

  TourModel(
      {this.name,
      this.address,
      this.details,
      this.price,
      this.imageList,
      this.ratting,
      this.id,
      this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'address': address,
      // 'totalNumberGuide': totalNumberGuide,
      'details': details,
      'price': price,
      'ratting': ratting,
      'imageList': imageList,
      'category': category
    };
  }

  factory TourModel.fromMap(Map<String, dynamic> map) {
    return TourModel(
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      ratting: map['ratting'] != null ? map['ratting'] as double : null,
      imageList: map['imageList'] != null
          ? List<String>.from(
              (map['imageList'] as List<dynamic>).map((x) => x as String))
          : null,
    );
  }
}

/*
List<TourModel> tourList = [
  TourModel(
      guidelist: [
        GuideModel(
            previewsTour: 4,
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            previewsTour: 10,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
      ],
      reviewList: [
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
      ],
      ratting: 4.5,
      name: "Lalbagh Fort",
      address: "Lalbagh Road, Dhaka",
      details:
          "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed that the construction of the fort was never completed. The fort consists of 3 frameworks – (i) ‘Diwan-I-Aam’, which was the residence of the Governor, (ii) a mosque and (iii) the tomb of Bibi Pari, who was the daughter of Emperor Saista Khan. Interestingly, there are some mysteries around this fort. There are tunnels underneath the fort which lead to the other side of the river. During the Sepoy Revolution of 1857, many soldiers tried to flee through those tunnels and died. Few British soldiers who followed them did not return. To investigate the situation, the researchers sent an elephant and a dog to those tunnels, but they didn’t return either. Soon after that horrific incident, the path was sealed.",
      price: 40,
      //  totalNumberGuide: 10,
      image:
          "https://www.travelmate.com.bd/wp-content/uploads/2019/08/Lalbagh-Fort.jpg"),
  TourModel(
      reviewList: [
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
      ],
      guidelist: [
        GuideModel(
            previewsTour: 4,
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            previewsTour: 10,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 15,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 14,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 23,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            previewsTour: 47,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351908/mushfiqur-rahim.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 28,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 46,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351908/mushfiqur-rahim.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 24,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 4,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            previewsTour: 34,
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
      ],
      name: "Ahsan Manzil",
      address: "Islampur Road, Dhaka",
      ratting: 3.5,
      details:
          "Initially, it was a vacation house for a Zamindar of Jamalpur district, Sheikh Enayet Ullah. After his death, his son sold this property to the French traders in 1740. They dug a pond in front of the building where fresh water could be fetched. After having a great business in the subcontinent for almost a century, they surrendered under the full British power and sold all their properties. So, in 1830, Khwaja Alimullah – an established man in Dhaka bought the property. He added a mosque in this compound. After his death, his son Khwaja Abdul Gani took a progressive look at the property and named it “Ahsan Manzil” after his son Ahsan Ullah. 1985, the Dhaka National Museum obtained this property and made it a museum after a long restoration process. The Palace is divided into 2 sides. ‘Rangmahal’ is on the eastern side. It was the entertainment spot where foreign and local girls danced and sang for the principal owner, Enayet Ullah. The ballroom was also there at this time. The Western side has a living room, dining room, library, card room and guest rooms. The Building is front-faced by the mighty Buriganga River. The architecture and the decoration epitomize the Mughal taste perfectly.",
      price: 60,
      //totalNumberGuide: 10,
      image:
          "https://www.travelmate.com.bd/wp-content/uploads/2019/08/Ahsan-Manzil.jpg"),
  TourModel(
      reviewList: [
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
      ],
      guidelist: [
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            previewsTour: 10,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 15,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 14,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 23,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            previewsTour: 47,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351908/mushfiqur-rahim.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 28,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 46,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351908/mushfiqur-rahim.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 24,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 4,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
      ],
      name: "Panam City",
      ratting: 2.5,
      address: "Sonargaon, Narayanganj",
      details:
          "The city is in Sonargaon of Narayanganj, just beside the capital Dhaka. The ancient architecture of the Mughal period is found here. Baro-Bhuiyans used to rule here. It was within the capital at that time. As a capital, Sonargaon was enriched with architectural beauties. Numerous British Colonial monuments and forts are seen across this 20km area.",
      price: 71,
      //totalNumberGuide: 25,
      image:
          "https://www.travelmate.com.bd/wp-content/uploads/2019/08/Panam-City.jpg"),
  TourModel(
      reviewList: [
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
        ReviewModel(
            name: "Tanzid Hasan",
            rating: 4.4,
            timeDate: "3 days",
            description:
                "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        ReviewModel(
            name: "Moeen Ali",
            rating: 3.2,
            timeDate: "2 days",
            description:
                "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
      ],
      guidelist: [
        GuideModel(
            previewsTour: 4,
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            previewsTour: 10,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 15,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            previewsTour: 14,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 23,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 28,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Tamim Iqbal",
            ratting: 4.6,
            address: "Kishoreganj Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 35,
            previewsTour: 46,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351908/mushfiqur-rahim.jpg"),
        GuideModel(
            name: "Tanzid Hasan",
            ratting: 4.4,
            address: "Dhaka Bangladesh",
            categories: ["History", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            tourPrice: 40,
            previewsTour: 24,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
        GuideModel(
            name: "Mushfiqur Rahim",
            ratting: 3.6,
            address: "Mymensingh Bangladesh",
            categories: ["River", "Sea", "Mounted"],
            educationQualification: "B.Sc Engineering ",
            isVerified: true,
            language: ["Bangla", "English", "Hindi"],
            previewsTour: 34,
            tourPrice: 63,
            image:
                "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
      ],
      name: "Mahansthangarh",
      ratting: 4.5,
      address: "Shibganj Thana, Bogra",
      details:
          "This place lies in a village in Bogra district called ‘Mahasthan.’ ‘Garh’ means fort, so ‘Mahasthangarh’ means fort of Mahasthan. Francis Buchanan Hamilton, a Physician, first discovered this place in 1808. However, he made some significant contributions as a Geographer during his stay on the Indian subcontinent. It is the last remaining piece of the village ‘Pundranagara’ of that time. The village was alive until the 8th century AD. This area is now preserved with a nice natural hilly look to enjoy leisure. People from everywhere come to spend some quiet time here with natural serenity.",
      price: 25,
      //totalNumberGuide: 10,
      image:
          "https://www.travelmate.com.bd/wp-content/uploads/2019/08/Mahasthangarh.jpg")
];
*/
