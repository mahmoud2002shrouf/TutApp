import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:advanced_flutter_arabic/domain/base_usecase/home_usecase.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/presentation/base/baseviwemodel.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    implements HomeViewModelInput, HomeViewModelOutput {
  final HomeUsecase _homeUsecase;
  HomeViewModel(this._homeUsecase);
  final _HomeSCrrenStreamController = BehaviorSubject<HomeScreenObject>();

  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    _HomeSCrrenStreamController.close();

    super.dispose();
  }

  _getHomeData() async {
    print("1");
    inputState.add(LoginState(
        stateRenderType: StateRenderType.fullScreenLodingStateRender));

    (await _homeUsecase.execute(Void)).fold(
      (l) => {
        print("2"),
        inputState.add(
            ErrorState(StateRenderType.fullScreenErrorStateRender, l.message)),
      },
      (r) => {
        print("3"),
        inputState.add(ContentState()),
        inputHomeScreen.add(
            HomeScreenObject(r.data?.services, r.data?.banners, r.data?.stores))
      },
    );
  }

  @override
  // TODO: implement inputHomeScreen
  Sink get inputHomeScreen => _HomeSCrrenStreamController.sink;

  @override
  // TODO: implement outputHomeSCrren
  Stream<HomeScreenObject> get outputHomeSCrren =>
      _HomeSCrrenStreamController.stream.map(
        (event) => event,
      );
}

abstract class HomeViewModelOutput {
  Stream<HomeScreenObject> get outputHomeSCrren;
}

abstract class HomeViewModelInput {
  Sink get inputHomeScreen;
}

class HomeScreenObject {
  List<Stores>? stores;
  List<Services>? services;
  List<Banners>? banners;
  HomeScreenObject(this.services, this.banners, this.stores);
}
