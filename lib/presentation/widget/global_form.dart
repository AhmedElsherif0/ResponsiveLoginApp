import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/constants/enum_global_authentication.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/password_icon.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/global_cubit/global_cubit.dart';
import '../styles/colors.dart';
import 'custom_elevated_button.dart';
import 'custom_form_field.dart';

class GlobalForm extends StatefulWidget {
  GlobalForm({Key? key}) : super(key: key);

  @override
  State<GlobalForm> createState() => _GlobalFormState();
}

class _GlobalFormState extends State<GlobalForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  FToast? fToast;

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _globalCubit(context).loginUser(
          _emailController.text.trim(), _passwordController.text.trim());
      _formKey.currentState!.save();
    }
    _formKey.currentState!.save();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _globalCubit(context).registerUser(
        _nameController.text.trim(),
        _phoneController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      _formKey.currentState?.save();
    }
    _formKey.currentState?.save();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: AppColor.white),
      child: BlocConsumer<GlobalCubit, GlobalStates>(
        listener: (context, state) {
          if (state is GlobalLoginError) {
            showToast('something went wrong ');
          }
          if (state is GlobalRegisterSuccess) {
            fToast = FToast();
            fToast?.init(context);
            showToast('Register Successfully');
          }
          if (state is GlobalLoginSuccess) {
            fToast = FToast();
            fToast?.init(context);
            showToast('Login Successfully');
          }
        },
        builder: (context, state) {
          if (state is GlobalRegisterSuccess) {
            if (state.accountModel.status == 200) {
              _delayedNavigator(context, state.accountModel.accountModels);
            }
          }
          if (state is GlobalLoginSuccess) {
            if (state.accountModel.status == 200) {
              _delayedNavigator(context, state.accountModel.accountModels);
            }
          }
          if (state is GlobalLoginLoading || state is GlobalRegisterLoading) {
            return const LoadingWidget();
          }
          return Column(
            children: [
              const Spacer(),
              Row(children: [
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (_globalCubit(context).changePage ==
                              GlobalAuth.register)
                            CustomFormField(
                              controller: _nameController,
                              textInputType: TextInputType.name,
                              hintText: 'Full Name',
                              validator: (value) {
                                if (value.isEmpty) return 'Invalid Name!';
                                return null;
                              },
                            ),
                          CustomFormField(
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'Email',
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                          if (_globalCubit(context).changePage ==
                              GlobalAuth.register)
                            CustomFormField(
                                controller: _phoneController,
                                textInputType: TextInputType.number,
                                hintText: 'Phone',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'phone must be 11 No.';
                                  }
                                  return null;
                                }),
                          CustomFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            obscureText:
                                _globalCubit(context).isPasswordRegistered,
                            prefixIcon: PasswordIcon(
                              isPassword:
                                  _globalCubit(context).isPasswordRegistered,
                              onPressed: state is GlobalRegisterLoading
                                  ? () {}
                                  : () {
                                      _globalCubit(context)
                                              .isPasswordRegistered =
                                          _globalCubit(context)
                                                  .isPasswordRegistered ==
                                              false;
                                      _globalCubit(context)
                                          .changeRegisterPassword(
                                              _globalCubit(context)
                                                  .isPasswordRegistered);
                                    },
                            ),
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value.isEmpty || value.length < 6) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                          ),
                          if (_globalCubit(context).changePage ==
                              GlobalAuth.register)
                            CustomFormField(
                                controller: _confirmPasswordController,
                                hintText: 'ConfirmPassword',
                                obscureText: _globalCubit(context)
                                    .isPasswordConfirmRegister,
                                prefixIcon: PasswordIcon(
                                  isPassword: _globalCubit(context)
                                      .isPasswordConfirmRegister,
                                  onPressed: state is GlobalRegisterLoading
                                      ? () {}
                                      : () {
                                          _globalCubit(context)
                                                  .isPasswordConfirmRegister =
                                              _globalCubit(context)
                                                      .isPasswordConfirmRegister ==
                                                  false;
                                          _globalCubit(context)
                                              .changeRegisterPassword(
                                                  _globalCubit(context)
                                                      .isPasswordConfirmRegister);
                                        },
                                ),
                                textInputType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return 'Wrong or less than 6 Letter!';
                                  } else if (value !=
                                      _passwordController.text) {
                                    return 'confirm not equal to the password';
                                  }
                                  return null;
                                }),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ]),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  CustomElevatedButton(
                    text: 'Login',
                    height: 7.h,
                    width: 36.w,
                    textStyle: Theme.of(context).textTheme.headline6,
                    onPressed: () {
                      if (_globalCubit(context).changePage ==
                          GlobalAuth.register) {
                        _globalCubit(context).changeAuthPageState();
                      }
                      _onLogin();
                    },
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                      onPressed: () {
                        if (_globalCubit(context).changePage ==
                            GlobalAuth.login) {
                          _globalCubit(context).changeAuthPageState();
                        }
                        _registerUser();
                      },
                      text: 'Register',
                      textStyle: Theme.of(context).textTheme.headline6,
                      height: 7.h,
                      width: 36.w),
                  const Spacer()
                ],
              ),
             const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }

  GlobalCubit _globalCubit(context) => BlocProvider.of(context);

  void _delayedNavigator(context, authModel) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                HomeScreen(accountModel: authModel),
          ),
        );
      });
    });
  }
}
