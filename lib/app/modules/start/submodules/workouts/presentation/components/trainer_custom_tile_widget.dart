import 'package:flutter/material.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class TrainerCustomTileWidget extends StatelessWidget {
  TrainerCustomTileWidget({this.onTap, this.trainer});
  TrainerEntity? trainer;
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
                        'https://tm.ibxk.com.br/2017/11/13/13180742448344.jpg?ims=1200x675',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, trace) {
                          return Center(
                            child: CustomTextWidget(
                                text: trainer != null
                                    ? trainer!.fullName![0].toUpperCase()
                                    : trainer!.fullName![0].toUpperCase()),
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
                      CustomTextWidget(text: "Professor(a): "),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextWidget(
                      text: trainer?.fullName ?? "", fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
