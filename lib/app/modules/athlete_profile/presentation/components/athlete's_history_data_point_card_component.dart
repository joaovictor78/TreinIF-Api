import 'package:flutter/material.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';

class AthletesHistoryDataPointCard extends StatelessWidget {
  AthletesHistoryDataPointCard(this.valueDataPoint,{this.onEditable, this.onDeleted});
  void Function()? onEditable;
  void Function()? onDeleted;
  ValueDataPointOfAthleteHistoricEntity? valueDataPoint;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.mediumGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CustomTextWidget(text: valueDataPoint?.type ?? ""),
          SizedBox(width: 6),
          CustomTextWidget(text: valueDataPoint?.value ?? ""),
          Spacer(),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: onEditable,
              icon: Icon(Icons.edit_rounded)),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: onDeleted,
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
