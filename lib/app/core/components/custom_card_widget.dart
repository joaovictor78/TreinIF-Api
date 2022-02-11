import 'package:flutter/material.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/styles/app_colors.dart';

class CustomListTileWidget extends StatelessWidget {
  CustomListTileWidget({this.onTap, this.teamEntity, this.athleteEntity});
  TeamEntity? teamEntity;
  AthleteEntity? athleteEntity;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mediumGrey.withAlpha(250),
      ),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                       teamEntity != null ? "" : 'https://img.r7.com/imag/afp-presidente-jair-bolsonaro-02122021180916996?dimensions=771x420',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, trace) {
                          return Center(
                            child: CustomTextWidget(text: teamEntity != null ?  teamEntity!.name![0].toUpperCase() : athleteEntity!.name![0].toUpperCase() ),
                          );
                        },
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: teamEntity != null ? teamEntity?.name ?? "" : athleteEntity?.name ?? ""),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextWidget(
                      text: "", fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
