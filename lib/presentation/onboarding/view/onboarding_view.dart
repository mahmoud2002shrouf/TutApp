import 'package:advanced_flutter_arabic/app/app_prefs.dart';
import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/presentation/onboarding/view%20model/onbordingviewmodel.dart';
import 'package:advanced_flutter_arabic/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/constance_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final Onbordingviewmodel _viewModel = Onbordingviewmodel();
  final AppPrefrances _appPrefrances = instance<AppPrefrances>();
  @override
  void initState() {
    _bind();
    super.initState();
  }

  void _bind() {
    _viewModel.start();
    _appPrefrances.setIsShowInbording();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _viewModel.outputSliderViewObject, builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return const  Center(child: CircularProgressIndicator(),);
      }
      if(snapshot.hasError){
        return  Center(child: Text(AppStrings.skip.tr()),);
      }
      if(snapshot.hasData){
        return _getContentWidget(snapshot.data!);
      }
      return  Container();
    },);
  }
  Widget _getContentWidget(SliderViewObject data){
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: data.numberOfSlide,
        onPageChanged: (value) {
       _viewModel.onPageChanged(value);
        },
        itemBuilder: (context, index) {
          return OnboardingPage(data.sliderObject);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip.tr(),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            ),
            Container(
                color: ColorManager.primary, child: _getBottomSheetWidget(data))
          ],
        ),
      ),
    );
  }
  Widget _getBottomSheetWidget(SliderViewObject data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstans.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc)),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < data.numberOfSlide; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i,data.currantIndex),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(_viewModel.goNext(),
                  duration: const Duration(
                      milliseconds: AppConstans.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc)),
          ),
        )
      ],
    );
  }

  Widget _getProperCircle(int i,int index) {
    if (i == index) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s40,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
