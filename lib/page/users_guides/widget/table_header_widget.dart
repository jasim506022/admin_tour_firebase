import 'package:flutter/material.dart';

import '../../../res/apps_colors.dart';
import '../../../res/constant.dart';

class TableHeaderWidget extends StatelessWidget {
  const TableHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: ConstantData.defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.deepBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeaderCell('Photo', textAlign: TextAlign.center, flex: 2),
          _buildHeaderCell('User Name'),
          _buildHeaderCell('Mobile', flex: 3),
          _buildHeaderCell('Email', flex: 5),
          _buildHeaderCell('Status', flex: 3),
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
