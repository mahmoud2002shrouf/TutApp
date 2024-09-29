import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/app/extensions.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:advanced_flutter_arabic/presentation/store_details/view%20model/store_details_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({Key? key}) : super(key: key);

  @override
  _StoreDetailsViewState createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final StoreDetailsViewmodel _viewmodel = instance<StoreDetailsViewmodel>();
  void _bind() {
    _viewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.storeDetails.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.white,
            )),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewmodel.outputState,
        builder: (context, snapshot) =>
            snapshot.data?.getScreenWidget(context, _getContent(), () {
              _viewmodel.start();
            }) ??
            _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: StreamBuilder<StoreDetails>(
        stream: _viewmodel.storeDetailsOutput,
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getStoreImage(snapshot.data?.image),
              const SizedBox(height:AppSize.s14 ,),
              _getSectionName(AppStrings.details.tr()),
              _getDetails(snapshot.data?.details),
              const SizedBox(height:AppSize.s14 ,),

              _getSectionName(AppStrings.services.tr()),
              _getDetails(snapshot.data?.services),
              const SizedBox(height:AppSize.s14 ,),

              _getSectionName(AppStrings.aboutStore.tr()),
              _getDetails(snapshot.data?.about),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSectionName(String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget _getDetails(String? details) {
    return Text(
      details.orEmpty(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _getStoreImage(String? image) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s190,
      child: Card(
        
        
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            side: BorderSide(color: ColorManager.primary, width: AppSize.s1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Image.network(
            image.orEmpty(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
}
