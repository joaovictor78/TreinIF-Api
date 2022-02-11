import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/start/submodules/home/domain/usecases/search_athletes_use_case.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeController(this._searchAthletesUseCase);
  final SearchAthletesUseCase _searchAthletesUseCase;
  var athletes = [].obs;
  var isLoading = false.obs;
  late AnimationController animationController;
  late Animation<double> nextPage;
  var carrouselBannerCurrentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.9);
  @override
  onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: Duration(seconds: 5), vsync: this);

    nextPage = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.addListener(() {
       
      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
        final int page = 2;
        if (carrouselBannerCurrentPage.value < page) {
          carrouselBannerCurrentPage.value++;
          if (pageController.hasClients)  pageController.animateToPage(carrouselBannerCurrentPage.value,
              duration: Duration(milliseconds: 100), curve: Curves.easeInSine);
        } else {
          carrouselBannerCurrentPage.value = 0;
          log(carrouselBannerCurrentPage.value.toString());
         if (pageController.hasClients) pageController.animateToPage(carrouselBannerCurrentPage.value,
              duration: Duration(milliseconds: 100), curve: Curves.easeInSine);
        }
      } 
    });
  }

  searchAthletes(String term) async {
    final result =
        await _searchAthletesUseCase(limit: 20, page: 1, searchTerm: term);
    if (!result.success) {
      return CustomToast.showToast("Ocorreu um erro ao pesquisar por atletas",
          backgroundColor: Colors.red);
    }
    athletes.value = RxList.of(result.data!);
  }
}
