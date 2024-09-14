import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../res/apps_colors.dart';
import '../../res/constant.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> userList = [
    UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),
    UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),
    UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),
    UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),
    UserModel(
        photo: "asset/image/image.jpg",
        name: "Md Jasim Uddin",
        mobile: "01980846830",
        email: "jasimrony50@gmail",
        status: "Active"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(ConstantData.defaultPadding),
        decoration:  BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListView(
          children: [
            _buildTableHeader(),
            Divider(),
          ...userList.map((e) =>  _buildRowData()).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildRowData() {
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "asset/image/image.jpg",
                              // "asset/image/image.jpg"Ensure the path is correct
                              fit: BoxFit
                                  .fill, // Ensures the image fits within the container
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _rowCellData(title: "Md Jasim Uddin"),
                  _rowCellData(title: "+8801980846830", flex: 3),
                  _rowCellData(title: "jasimrony50@gmail.com", flex: 5),
                  _rowCellData(title: "Active", flex: 2),
                  _rowCellData(title: "View Profile"),
                ],
              ),
        Divider()
      ],
    );
  }

  Expanded _rowCellData({required String title, int flex = 4}) {
    return Expanded(
        flex: flex,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(.85),
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeaderCell('Photo', textAlign: TextAlign.center, flex: 2),
          _buildHeaderCell('User Name'),
          _buildHeaderCell('Mobile', flex: 3),
          _buildHeaderCell('Email', flex: 5),
          _buildHeaderCell('Status', flex: 2),
          _buildHeaderCell("View User"),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String label,
      {TextAlign textAlign = TextAlign.start, int flex = 4}) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: textAlign,
      ),
    );
  }
}

class UserModel {
  final String photo;
  final String name;
  final String mobile;
  final String email;

  final String status;

  UserModel(
      {required this.photo,
      required this.name,
      required this.mobile,
      required this.email,
      required this.status});
}

/*
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
 */
