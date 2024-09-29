import 'dart:ffi';

import 'package:advanced_flutter_arabic/domain/base_usecase/store_details_usecase.dart';
import 'package:advanced_flutter_arabic/presentation/base/baseviwemodel.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailsViewmodel extends BaseViewModel
    implements StoreDetailsViewmodelInput, StoreDetailsViewmodelOutput {
  final StoreDetailsUsecase _storeDetailsUsecase;
  StoreDetailsViewmodel(this._storeDetailsUsecase);
  final _storeDetailesStreamController = BehaviorSubject<StoreDetails>();
  @override
  void start() {
    getStoreDetails();
  }

  @override
  void dispose() {
    _storeDetailesStreamController.close();
    super.dispose();
  }

  @override
  // TODO: implement storeDetailsInput
  Sink get storeDetailsInput => _storeDetailesStreamController.sink;

  @override
  // TODO: implement storeDetailsOutput
  Stream<StoreDetails> get storeDetailsOutput =>
      _storeDetailesStreamController.stream.map(
        (event) => event,
      );

  getStoreDetails() async {
    inputState.add(LoginState(
        stateRenderType: StateRenderType.fullScreenLodingStateRender));
    (await _storeDetailsUsecase.execute(Void)).fold(
      (l) => {
        inputState.add(
            ErrorState(StateRenderType.fullScreenErrorStateRender, l.message)),
      },
      (r) async => {
        inputState.add(ContentState()),
        storeDetailsInput.add(r),
      },
    );
  }
}

abstract class StoreDetailsViewmodelInput {
  Sink get storeDetailsInput;
}

abstract class StoreDetailsViewmodelOutput {
  Stream<StoreDetails> get storeDetailsOutput;
}
