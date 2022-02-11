import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/components/custom_workout_card_widget.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/core/components/custom_calendar.dart';
import '/app/core/components/custom_card_widget.dart';
import '/app/modules/manage_workouts_by_team/controllers/manage_workout_controller.dart';
import '/app/core/components/custom_tab_item_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class ManageWorkoutPage extends GetView<ManageWorkoutController> {
  const ManageWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: "Equipe: Name", fontSize: 20),
                        CustomTextWidget(text: "Código: #####:", fontSize: 15),
                        Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Row(
                                children: [
                                  CustomTabItemWidget(
                                      "Equipe",
                                      controller.currentIndex.value,
                                      0, (index) {
                                    controller.changePage(index);
                                  }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CustomTabItemWidget(
                                      "Atletas",
                                      controller.currentIndex.value,
                                      1, (index) {
                                    controller.changePage(index);
                                  }),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.changePage(index);
                        },
                        children: [
                          trainingListByTeam(),
                          RefreshIndicator(
                            color: AppColors.lightBlue,
                            onRefresh: () async {},
                            child: ListView.builder(
                                itemCount: controller.athletes.length,
                                itemBuilder: (context, index) {
                                  AthleteEntity athleteEntity =
                                      controller.athletes[index];
                                  return SizedBox(
                                    height: 70,
                                    child: CustomListTileWidget(
                                      athleteEntity: athleteEntity,
                                      onTap: () {
                                        Get.toNamed("/athlete_profile");
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ]))));
  }

  Widget trainingListByTeam() {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 360));
    DateTime endDate = DateTime.now().add(const Duration(days: 360));
    DateTime selectedDate = DateTime.now().subtract(const Duration(days: 2));

    _monthNameWidget(monthName) {
      return Container(
        child: Text(
          monthName,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        padding: EdgeInsets.only(top: 8, bottom: 4),
      );
    }

    dateTileBuilder(
        date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
      bool isSelectedDate = date.compareTo(selectedDate) == 0;
      Color fontColor = isDateOutOfRange ? Colors.white : Colors.white;
      TextStyle normalStyle = TextStyle(
          fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
      TextStyle selectedStyle = const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black);
      TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
      List<Widget> _children = [
        Text(dayName, style: dayNameStyle),
        Text(date.day.toString(),
            style: !isSelectedDate ? normalStyle : selectedStyle),
      ];
      return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
            color: !isSelectedDate ? Colors.transparent : AppColors.lightBlue,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: _children,
        ),
      );
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                  text: "Treino", fontSize: 15, fontWeight: FontWeight.w600),
              OutlinedButton(
                  child: CustomTextWidget(text: "Adicionar exercícios"),
                  onPressed: () {
                    Get.toNamed("/add_exercise", parameters: {
                      "workout_id": controller.workoutID.toString(),
                      "workout_type":
                          ExerciseClassificationEnum.team.value.toString(),
                      "day_of_week_selected_in_tab":
                          DateFormat('EEEE').format(controller.selectedDate)
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Colors.white))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CalendarStrip(
              containerHeight: 100,
              startDate: startDate,
              endDate: endDate,
              selectedDate: selectedDate,
              onDateSelected: (DateTime date) => {
                print(DateFormat('EEEE').format(date)),
                controller.selectedDate = date,
                controller.getExercisesByDayOfWeek(
                    controller.workoutID, DateFormat('EEEE').format(date))
              },
              dateTileBuilder: dateTileBuilder,
              iconColor: Colors.black,
              monthNameWidget: _monthNameWidget,
            ),
          ),
          Obx(() {
            return Expanded(
              child: controller.exercises.isEmpty
                  ? Center(
                      child: CustomTextWidget(
                          text: "Nenhum treino encontrado, adicione-os!"))
                  : ListView.separated(
                      itemCount: controller.exercises.length,
                      itemBuilder: (context, index) {
                        ExerciseEntity exercise = controller.exercises[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomWorkoutWidget(exercise),
                        );
                      },
                      separatorBuilder: (_, __) => Container(
                        height: 10,
                      ),
                    ),
            );
          }),
        ]));
  }
}
