import 'package:advanced_flutter_arabic/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/font_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

enum StateRenderType {
  pupupLodingStateRender,
  pupupErrorStateRender,
  pupupSuccessStateRender,

  fullScreenLodingStateRender,
  fullScreenEmptyStateRender,
  fullScreenErrorStateRender,

  contentStateRender

}

class StateRender extends StatelessWidget {
  StateRenderType stateRenderType;
  String message;
  String title;
  Function retryActionFunction;
  StateRender(
      {required this.stateRenderType,
      this.message = AppStrings.loadnig,
      this.title = "",
      required this.retryActionFunction});
  @override
  Widget build(BuildContext context) {
    return _getContent(context);
  }

  Widget _getContent(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.pupupLodingStateRender:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRenderType.pupupErrorStateRender:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message.tr()),
          _getRetryButton(context,AppStrings.ok.tr())
        ]);
      case StateRenderType.pupupSuccessStateRender:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(AppStrings.succcess.tr()),

          _getMessage(message),
          _getRetryButton(context,AppStrings.ok.tr())
        ]);
      case StateRenderType.fullScreenLodingStateRender:
        return _getItemColum(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(message)]);
      case StateRenderType.fullScreenEmptyStateRender:
        return _getItemColum([
          _getAnimatedImage(JsonAssets.empty),
          _getMessage(message),
        ]);
      case StateRenderType.fullScreenErrorStateRender:
        return _getItemColum([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(context,AppStrings.retryAgain.tr())
        ]);

      case StateRenderType.contentStateRender:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s14),
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> content) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: content,
    );
  }

  Widget _getItemColum(List<Widget> items) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items,
    );
  }

  Widget _getAnimatedImage(String animatedName) {
    return SizedBox(
      width: AppSize.s100,
      height: AppSize.s100,
      child: Lottie.asset(animatedName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(BuildContext context, String buttonTitle) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // اغلاق الـ dialog قبل إعادة المحاولة
            if (stateRenderType == StateRenderType.fullScreenErrorStateRender) {
              retryActionFunction.call(); // لإعادة تنفيذ الوظيفة من جديد
            }
          },
          child: Text(buttonTitle),
        ),
      ),
    ),
  );
}

}
