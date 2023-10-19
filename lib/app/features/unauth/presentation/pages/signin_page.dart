import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/core/ui/custom_textfield.dart';
import 'package:lily/app/features/unauth/presentation/bloc/auth/auth_bloc.dart';
import 'package:lily/app/features/unauth/presentation/widgets/loading_widget.dart';
import 'package:lily/app/navigation/unauth_navigation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffFDDCDC),
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: globalSL<AuthBloc>(),
        builder: (context, state) {
          if (state is LoadingAuthState) return const LoadingWidget();
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    ImageAsset.lilyLogo,
                    height: 200.h,
                    fit: BoxFit.fitHeight,
                  ),
                  40.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        26.ph,
                        CustomTextField(
                          controller: _passwordController,
                          obscureText: true,
                          hintText: 'Password',
                        ),
                        46.ph,
                        CustomButton.textBtn(
                          title: 'Sign in',
                          width: double.infinity,
                          fontSize: 20,
                          color: theme.secondaryColor,
                          onPressed: () async {
                            globalSL<AuthBloc>().add(LogInAuthEvent());
                          },
                        ),
                        64.ph,
                        GestureDetector(
                          onTap: () {
                            globalSL<UnauthNavigation>().goRouter.go(UnauthNavigation.signup);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Do not have an account? ',
                                  style: theme.headline2.copyWith(fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: 'Sign up',
                                  style: theme.headline2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
