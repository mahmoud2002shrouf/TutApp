import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/presentation/common/state%20render/flow_state.dart';
import 'package:advanced_flutter_arabic/presentation/forgot_password/View%20model/forgetPassword_view_model.dart';
import 'package:advanced_flutter_arabic/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _inputEmailController = TextEditingController();

  final ForgetpasswordViewModel _viewModel =
      instance<ForgetpasswordViewModel>();
  final _key = GlobalKey<FormState>();
  void bind() {
    _viewModel.start();
    _inputEmailController.addListener(
      () => _viewModel.setEmail(_inputEmailController.text),
    );
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, getContent(), () {
                _viewModel.sendRequest();
              }) ??
              getContent();
        },
      ),
    );
  }

  Widget getContent() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
            key: _key,
            child: Column(
              children: [
                Center(
                  child: Image.asset(ImageAssets.splashLogo),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputEmail,
                    builder: (context, snapshot) => TextFormField(
                      controller: _inputEmailController,
                      decoration: InputDecoration(
                          hintText: AppStrings.email.tr(),
                          labelText: AppStrings.email.tr(),
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.enterEmail.tr()),
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outputEmail,
                      builder: (context, snapshot) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed:(snapshot.data ?? false)
                                    ? () {
                                        _viewModel.sendRequest();
                                      }
                                    : null,
                            child: Text(AppStrings.send.tr())),
                      )),
                )
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _inputEmailController.dispose();
    super.dispose();
  }
}
