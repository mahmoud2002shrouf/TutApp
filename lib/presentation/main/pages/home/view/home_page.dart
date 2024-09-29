import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/state_render.dart';
import 'package:advanced_flutter_arabic/presentation/main/pages/home/view%20model/home_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   _viewModel.inputState.add(LoginState(stateRenderType: StateRenderType.fullScreenLodingStateRender));
            //   return Text("data");
            // } else {
            return snapshot.data?.getScreenWidget(context, _getContent(), () {
                  _viewModel.start();
                }) ??
                _getContent();
            // }
          },
        ),
      ),
    );
  }

  Widget _getContent() {
    return StreamBuilder<HomeScreenObject>(
        stream: _viewModel.outputHomeSCrren,
        builder: (context, snapshot) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getBanner(snapshot.data?.banners),
                _getSection(AppStrings.services.tr()),
                _getServicesWidget(snapshot.data?.services),
                _getSection(AppStrings.stores.tr()),
                _getStoriesWidget(snapshot.data?.stores),
              ],
            ),
          );
        });
  }

  Widget _getBanner(List<Banners>? banners) {
    if (banners == null) {
      return Container();
    } else {
      return CarouselSlider(
          items: banners
              .map(
                (e) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: AppSize.s1_5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        side: BorderSide(
                            color: ColorManager.primary, width: AppSize.s1)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Image.network(
                        e.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              autoPlay: true,
              height: AppSize.s190,
              enableInfiniteScroll: true,
              enlargeCenterPage: true));
    }
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  Widget _getServicesWidget(List<Services>? services) {
    if (services != null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
        ),
        child: Container(
          height: AppSize.s190,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView.builder(
            itemCount: services.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
                color: ColorManager.white,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Image.network(
                        services[index].image,
                        fit: BoxFit.cover,
                        width: AppSize.s140,
                        height: AppSize.s140,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p8),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            services[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStoriesWidget(List<Stores>? stores) {
    if (stores != null) {
      return Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p12,
            right: AppPadding.p12,
          ),
          child: Flex(
            direction: Axis.vertical,
            children: [
              GridView.count(
                  crossAxisCount: AppSize.s2,
                  mainAxisSpacing: AppSize.s8,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    stores.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.storeDetailsRoute);
                        },
                        child: Card(
                            elevation: AppSize.s4,
                            child: Image.network(
                              stores[index].image,
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                  ))
            ],
          ));
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
