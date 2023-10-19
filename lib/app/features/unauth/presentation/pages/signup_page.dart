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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _password1Controller.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffFDDCDC),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: globalSL<AuthBloc>(),
        builder: (context, state) {
          if (state is LoadingAuthState) return const LoadingWidget();
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImageAsset.lilyLogo,
                      height: 200.h,
                      fit: BoxFit.fitHeight,
                    ),
                    40.ph,
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    26.ph,
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),
                    26.ph,
                    CustomTextField(
                      controller: _password1Controller,
                      obscureText: true,
                      hintText: 'Password',
                    ),
                    26.ph,
                    CustomTextField(
                      controller: _password2Controller,
                      obscureText: true,
                      hintText: 'Repeat password',
                    ),
                    46.ph,
                    CustomButton.textBtn(
                      title: 'Sign up',
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
                        globalSL<UnauthNavigation>().goRouter.go(UnauthNavigation.signin);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account? ',
                              style: theme.headline2.copyWith(fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: theme.headline2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
