import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/athlete_profile/presentation/components/custom_data_point_modal_dialog_component.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/modules/athlete_profile/presentation/components/athlete_data_point_indicator_component.dart';
import '/app/core/components/custom_text_widget.dart';

class AthletesHistoryComponent extends StatelessWidget {
  AthletesHistoryComponent();
  AthleteProfileController _athleteProfileController =
      Get.find<AthleteProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: CustomTextWidget(text: "Histórico do Atleta"),
          ),
          Expanded(
              child: _athleteProfileController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : _athleteProfileController.dataPoints.isEmpty
                      ? Container(
                          padding: EdgeInsets.only(top: 70),
                          alignment: Alignment.topCenter,
                          child: CustomTextWidget(
                              text:
                                  "Nenhum ponto de dados encontrado, adicione-os\nao historico!",
                              textAlign: TextAlign.center))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 10),
                              itemCount:
                                  _athleteProfileController.dataPoints.length,
                              itemBuilder: (context, index) {
                                DataPointOfAthleteHistoricEntity _dataPoint =
                                    _athleteProfileController.dataPoints[index];
                                return GestureDetector(
                                  onLongPress: () {
                                    if (!_athleteProfileController.open.value) {
                                      _athleteProfileController
                                              .persistentBottomSheetController =
                                          _athleteProfileController
                                              .key.currentState!
                                              .showBottomSheet(
                                                  (_) => Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.4,
                                                      width: double.maxFinite,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 6,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: AppColors
                                                                      .mediumGrey),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.2,
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(Icons
                                                                      .settings),
                                                                  CustomTextWidget(
                                                                      text:
                                                                          "Gerenciar Ponto de Dado",
                                                                      fontSize:
                                                                          15),
                                                                ]),
                                                            SizedBox(
                                                                height: 30),
                                                            ListTile(
                                                              onTap: () {
                                                                customDataPointModalDialogComponent(
                                                                    context,
                                                                    true,
                                                                    index,
                                                                    _dataPoint
                                                                        .id!);
                                                              },
                                                              leading: Icon(Icons
                                                                  .calendar_today),
                                                              title: CustomTextWidget(
                                                                  text:
                                                                      "Editar Data do Ponto De Dado",
                                                                  fontSize: 14),
                                                            ),
                                                            Divider(
                                                                color: AppColors
                                                                    .lightGrey,
                                                                height: 20),
                                                            ListTile(
                                                              onTap: () {
                                                                _athleteProfileController
                                                                    .removeHistoricOfAthlete(
                                                                        _dataPoint
                                                                            .id!);
                                                              },
                                                              leading: Icon(
                                                                  Icons.delete),
                                                              title: CustomTextWidget(
                                                                  text:
                                                                      "Remover Ponto De Dado",
                                                                  fontSize: 14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      AppColors.darkGrey);
                                    } else {
                                      _athleteProfileController
                                          .persistentBottomSheetController
                                          .close();
                                    }
                                    _athleteProfileController.open.value =
                                        !_athleteProfileController.open.value;
                                  },
                                  onTap: () {
                                    if (_athleteProfileController
                                            .currentIndex.value ==
                                        0) {
                                      Map _data = {};
                                      _data["id"] = Get.arguments.id;
                                      _data["historic"] = _dataPoint;
                                      Get.toNamed("/athlete_profile/historic",
                                          arguments: _data);
                                    }
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 60,
                                          child:
                                              AthleteDataPointIndicatorComponent()),
                                      SizedBox(width: 7),
                                      Container(
                                        height: 130,
                                        width: 20,
                                        child: Stack(children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                                margin: index == 0
                                                    ? EdgeInsets.only(
                                                        top: 10,
                                                        bottom: index ==
                                                                _athleteProfileController
                                                                        .dataPoints
                                                                        .length -
                                                                    1
                                                            ? 10
                                                            : 0)
                                                    : EdgeInsets.zero,
                                                height: 200,
                                                color: Colors.white),
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: ShapeDecoration(
                                                shape: CircleBorder(),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          (() {
                                            if (index ==
                                                _athleteProfileController
                                                        .dataPoints.length -
                                                    1) {
                                              return Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: ShapeDecoration(
                                                    shape: CircleBorder(),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            }
                                            return Container();
                                          }())
                                        ]),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 250,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: AppColors
                                                          .lightGrey))),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 20),
                                                  CustomTextWidget(
                                                      text:
                                                          "Data ${_dataPoint.date}"),
                                                  SizedBox(height: 10),
                                                  (() {
                                                    if (_dataPoint.values ==
                                                        null) {
                                                      return Container();
                                                    }
                                                    for (int count = 0;
                                                        count <
                                                            _dataPoint
                                                                .values!.length;
                                                        count++) {
                                                      if (count <= 3) {
                                                        return CustomTextWidget(
                                                            text:
                                                                "${_dataPoint.values![count].type} ${_dataPoint.values![count].value}");
                                                      }
                                                    }
                                                    if (_dataPoint
                                                            .values!.length >
                                                        3) {
                                                      return CustomTextWidget(
                                                        text:
                                                            "ver mais + ${_dataPoint.values!.length - 3} items",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      );
                                                    }
                                                    return Container();
                                                  }())
                                                ],
                                              ),
                                              Spacer(),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ))
        ],
      );
    });
  }
}
