import 'package:advanced_flutter_arabic/app/constance.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRenderType getStateRender();
  String getMessage();
}

class LoginState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  LoginState(
      {required this.stateRenderType, this.message = AppStrings.loadnig});
  @override
  String getMessage() {
    return message.tr();
  }

  @override
  StateRenderType getStateRender() {
    return stateRenderType;
  }
}

class ErrorState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  
  ErrorState(this.stateRenderType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRender() => stateRenderType;
}
class SuccessState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  SuccessState(this.stateRenderType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRender() => stateRenderType;
}

class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() {
    return Constance.empty;
  }

  @override
  StateRenderType getStateRender() {
    return StateRenderType.contentStateRender;
  }
}

class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);
  @override
  String getMessage() {
    return message;
  }

  @override
  StateRenderType getStateRender() {
    return StateRenderType.fullScreenEmptyStateRender;
  }
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoginState:
        {
            print("soso");

          if (getStateRender() == StateRenderType.pupupLodingStateRender) {
            // show popup loading
            showPopup(context, getStateRender(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            print("soso");
            return StateRender(
                message: getMessage(),
                stateRenderType: getStateRender(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRender() == StateRenderType.pupupErrorStateRender) {
            // show popup error
            showPopup(context, getStateRender(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen error state
            return StateRender(
                message: getMessage(),
                stateRenderType: getStateRender(),
                retryActionFunction: retryActionFunction);
          }
        }
      case SuccessState:
        {
          dismissDialog(context);
          if (getStateRender() == StateRenderType.pupupSuccessStateRender) {
            // show popup error
            showPopup(context, getStateRender(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen error state
            return StateRender(
                message: getMessage(),
                stateRenderType: getStateRender(),
                retryActionFunction: retryActionFunction);
          }
        }
      case EmptyState:
        {
          return StateRender(
              stateRenderType: getStateRender(),
              message: getMessage(),
              retryActionFunction: () {});
        }
      case ContentState:
        {
          // dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

void dismissDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  });
}



  showPopup(
      BuildContext context, StateRenderType stateRendererType, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRender(
            stateRenderType: stateRendererType,
            message: message,
            retryActionFunction: () {})));
  }
}
