import 'package:bd_tour_firebase_admin/page/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTourWidget extends StatefulWidget {
  const DetailsTourWidget({super.key, required this.tourModel});

  final TourModel tourModel;

  @override
  State<DetailsTourWidget> createState() => _DetailsTourWidgetState();
}

class _DetailsTourWidgetState extends State<DetailsTourWidget> {
  var image = [
    "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://www.bd-pratidin.com/en/assets/news_images/2024/08/17/201243_bangladesh_pratidin_fjhrtjrjyrjry.jpg",
    "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://www.bd-pratidin.com/en/assets/news_images/2024/08/17/201243_bangladesh_pratidin_fjhrtjrjyrjry.jpg",
  ];

  int photoIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var tourModel = Get.arguments;
    return PopScope(
 canPop: true
      ,
      onPopInvoked: (didPop) {

       if(didPop){
        print("BAngladesh");
         // Get.to(MainPage());
       }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // The image with overlay
                    Stack(
                      children: [
                        // The image
                        // Image.network(
                        //   tourModel.imageList![0],
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height * 0.9,
                        //   fit: BoxFit.cover,
                        // ),
                        // The black opacity overlay
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.9,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                 widget.   tourModel.name!,
                                    style: GoogleFonts.alfaSlabOne(
                                        letterSpacing: 2.5,
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    descrp,
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )),
                            /*
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .08,
                                  vertical:
                                      MediaQuery.of(context).size.width * .05),
                              height: 400,
                              decoration:
                                  const BoxDecoration(color: Color(0xff252525)),
                              child: Column(
                                children: [
                                  Image.network(
                                    widget.   tourModel.imageList![photoIndex],
                                    height: 325,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    height: 45,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      // shrinkWrap: true,
                                      itemCount: widget. tourModel.imageList!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            photoIndex = index;
                                            setState(() {});
                                          },
                                          child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  widget.        tourModel.imageList![index],
                                                  fit: BoxFit.fill,
                                                  height: 40,
                                                  width: 80,
                                                ),
                                              )),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),

                             */
                          ],
                        ),
                      ],
                    ),
                    /*
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.82,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xff252525),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category: ${widget.tourModel.category}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Ratting: ${widget.tourModel.ratting}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.yellow,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                     */
                    // Positioned content below the image
                  ],
                ),
              ),
              /*
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff252525),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Price: ${widget.tourModel.price}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff252525),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Location: ${widget.tourModel.address}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 40),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff252525),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget. tourModel.details!,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),

               */
            ],
          ),
        ),
      ),
    );
  }
}

String descrp =
    "A murder case was filed against former prime minister Sheikh Hasina, former education minister Mohibul Hasan Chowdhury Nowfel and 32 other people at Chandgaon Police Station in the city, reports BSS. The case was filed over the killing of Higher Secondary Certificate (HSC) examinee of Ashekan Awlia Degree College Tanvir Siddique (19). He was shot dead in a clash between protesters and police and Awami League activists during quota reform movement on July 18 in the port city's Bahaddarhat area. Tanvir’s paternal uncle Mohammad Parvez filed the case with the Chandgaon Police Station against 34 names, including Sheikh Hasina and Nowfel, and 40 to 50 unnamed people on Friday night. Chandgaon Police Station Officer-in-charge Jahidul Kabir confirmed about filing of the case and said Inspector (investigation) Md Sabed Ali has been given the task of investigating into the case. In the case statement, the plaintiff said his nephew Tanveer Siddiqui took part in the 'shut-down' programme with other students under the banner of anti-discrimination student movement around 2.30pm on July 18. The students arrived on the road adjacent to Bahaddarhat Kitchen Market of Chandgaon police station with procession from Muradpur area of ??Panchlaish police station and they were sitting there peacefully. But around 4.20pm, at the directives of the former prime minister and former education minister, along with mentioned 32 accused, more 40-50 unidentified persons came from the direction of WAPDA office with lethal firearms and locally-made weapons, including machetes and daggers and started throwing brick bats and stones along with opening fire at Tanvir Siddiqui and other students indiscriminately. Many protesters including Tanvir were shot and received injuries. Tanvir was taken to Chattogram Medical College Hospital, where the duty doctor declared him dead.";
