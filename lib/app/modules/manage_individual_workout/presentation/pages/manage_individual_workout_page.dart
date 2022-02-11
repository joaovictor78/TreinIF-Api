import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/manage_individual_workout/controllers/manage_individual_workout_controller.dart';
import '/app/core/components/custom_calendar.dart';
import '/app/core/components/custom_workout_card_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class ManageIndividualWorkoutPage
    extends GetView<ManageIndividualWorkoutController> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: CustomTextWidget(
                  text: LoggedUserPO.logeedUser!.user!.userType ==
                          UserTypesEnum.athlete
                      ? "Meu Treino Individual"
                      : "Treino Individual",
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: CustomTextWidget(
                  text: LoggedUserPO.logeedUser!.user!.userType ==
                          UserTypesEnum.athlete
                      ? "Treino criado por: ${controller.trainerEntity.fullName} "
                      : "Atleta: ${controller.athleteEntity.name}",
                  fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            trainingListByTeam(context),
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
          ]),
        )));
  }
}

Widget trainingListByTeam(BuildContext context) {
  DateTime startDate = DateTime.now().subtract(const Duration(days: 360));
  DateTime endDate = DateTime.now().add(const Duration(days: 360));
  ManageIndividualWorkoutController controller =
      Get.find<ManageIndividualWorkoutController>();

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.white : Colors.white;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
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

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 27),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
              text: "Treino", fontSize: 15, fontWeight: FontWeight.w600),
          Offstage(
            offstage: LoggedUserPO.logeedUser!.user!.userType ==
                UserTypesEnum.athlete,
            child: OutlinedButton(
                child: CustomTextWidget(text: "Adicionar exercícios"),
                onPressed: () {
                  Get.toNamed("/add_exercise", parameters: {
                    "workout_id": controller.workoutID.toString(),
                    "workout_type":
                        ExerciseClassificationEnum.individual.value.toString(),
                    "day_of_week_selected_in_tab":
                        DateFormat('EEEE').format(controller.selectedDate)
                  });
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: Colors.white))),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CalendarStrip(
          containerHeight: 100,
          startDate: startDate,
          endDate: endDate,
          selectedDate: controller.selectedDate,
          onDateSelected: (DateTime date) => {
            print(DateFormat('EEEE').format(date)),
            controller.selectedDate = date,
            if (LoggedUserPO.logeedUser!.user!.userType ==
                UserTypesEnum.athlete)
              {}
            else
              {
                controller.getExercisesByDayOfWeek(
                    controller.workoutID, DateFormat('EEEE').format(date))
              }
          },
          dateTileBuilder: dateTileBuilder,
          iconColor: Colors.black,
          monthNameWidget: _monthNameWidget,
        ),
      ),
    ]),
  );
}
