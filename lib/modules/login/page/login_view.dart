import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginCubit _loginCubit = LoginCubit();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String errorMessage = "";

  bool isPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => _loginCubit),
            ],
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (cLogin, sLogin) {
                if (sLogin is OnLoadingGetAuthLogin) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (sLogin is OnSuccessGetAuthLogin) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pushReplacementNamed(context, routeHome);
                }
                if (sLogin is OnErrorGetAuthLogin) {
                  setState(() {
                    errorMessage = '${sLogin.errorMessage}';
                    isLoading = false;
                  });
                }
              },
              builder: (cLogin, sLogin) {
                return Stack(
                  children: [
                    Image.asset(
                      "assets/images/backgrounds/splash_screen_background.png",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Login",
                            style: textExtraLarge(color: neutral30),
                          ),
                          AppDimens.verticalSpace24,
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            style: textNormal(color: neutral30),
                            decoration: textInputDecoration(
                              hintText: "Enter Email",
                              fillColor: Colors.white.withOpacity(0.2),
                              isFilled: true,
                              colorBorder: Colors.transparent,
                            ),
                            onChanged: (value) {
                              if (errorMessage != "") {
                                setState(() {
                                  errorMessage = "";
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please input the email!";
                              } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                return "Email is not valid!";
                              } else if (errorMessage != "") {
                                return "";
                              }
                            },
                            controller: _emailTextEditingController,
                          ),
                          if (errorMessage == "") AppDimens.verticalSpace12,
                          TextFormField(
                            style: textNormal(color: neutral30),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _passwordTextEditingController,
                            onChanged: (value) {
                              if (errorMessage != "") {
                                setState(() {
                                  errorMessage = "";
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please input the password!";
                              } else if (value.length < 4) {
                                return "Password minimum 4 letter";
                              } else if (errorMessage != "") {
                                return errorMessage;
                              }
                            },
                            decoration: textInputDecoration(
                              hintText: "Enter Password",
                              errorMaxLines: 4,
                              fillColor: Colors.white.withOpacity(0.2),
                              isFilled: true,
                              colorBorder: Colors.transparent,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: isPassword ? neutral70 : Colors.white,
                                ),
                              ),
                            ),
                            obscureText: isPassword,
                            obscuringCharacter: "*",
                          ),
                          AppDimens.verticalSpace24,
                          BigButtonGradient(
                            text: "Login",
                            textStyle: textMedium(
                              color: neutral30,
                              isBold: true,
                            ),
                            isLoading: isLoading,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                _loginCubit.post(
                                  data: LoginParram(
                                    nip: _emailTextEditingController.text,
                                    password: _passwordTextEditingController.text,
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      // body: ,
    );
  }
}
