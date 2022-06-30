import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/mixin_delay_navigator.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/show_toast_mixin.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/password_icon.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/row_of_buttons.dart';
import '../../business_logic/global_cubit/global_cubit.dart';
import '../styles/colors.dart';
import 'custom_form_field.dart';

class RegisterFormFields extends StatefulWidget {
  const RegisterFormFields({Key? key}) : super(key: key);

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields>
    with DelayNavigator, ShowToastMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }


  GlobalCubit _globalCubit(context) => BlocProvider.of(context);


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: AppColor.white),
      child: BlocConsumer<GlobalCubit, GlobalStates>(
        listener: (context, state) {
          if (state is GlobalRegisterSuccess) {
            showToastFromMixin(context, '${state.accountModel.message}');
          }
          if (state is GlobalRegisterError) {
            showToastFromMixin(context, 'Something Went Wrong');
          }
        },
        builder: (context, state) {
          if (state is GlobalRegisterLoading) {
            return const LoadingWidget();
          }
          return Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: _nameController,
                              textInputType: TextInputType.name,
                              hintText: translate('name'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return translate('nameValidation');
                                }
                                return null;
                              },
                            ),
                            CustomFormField(
                              controller: _emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: translate('email'),
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return translate('emailValidation');
                                }
                                return null;
                              },
                            ),
                            CustomFormField(
                                controller: _phoneController,
                                textInputType: TextInputType.number,
                                hintText: translate('phone'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return translate('phoneValidation');
                                  }
                                  return null;
                                }),
                            CustomFormField(
                              controller: _passwordController,
                              hintText: translate('password'),
                              obscureText:
                                  _globalCubit(context).isPasswordRegistered,
                              suffixIcon:
                                  _onIconRegisteredPassword(context, state),
                              textInputType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return translate('passwordValidation');
                                }
                                return null;
                              },
                            ),
                            CustomFormField(
                                controller: _confirmPasswordController,
                                hintText: translate('confirmPassword'),
                                obscureText: _globalCubit(context)
                                    .isPasswordConfirmRegister,
                                suffixIcon:
                                    _onIconConfirmPassword(context, state),
                                textInputType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return translate('confirmShortValidation');
                                  } else if (value !=
                                      _passwordController.text) {
                                    return translate(
                                        'confirmNotEqualValidation');
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              RowOfButtons(
                  onPressedRegister: () => _registerUser(),
                  onPressedLogin: () => Navigator.of(context)
                      .pushReplacementNamed(Constants.loginUserScreen)),
              const Spacer(flex: 4),
            ],
          );
        },
      ),
    );
  }

  PasswordIcon _onIconRegisteredPassword(context, state) {
    return PasswordIcon(
      isPassword: _globalCubit(context).isPasswordRegistered,
      onPressed: state is GlobalRegisterLoading
          ? () {}
          : () => _globalCubit(context).changeRegisterPassword(
              _globalCubit(context).isPasswordRegistered),
    );
  }

  PasswordIcon _onIconConfirmPassword(context, state) {
    return PasswordIcon(
      isPassword: _globalCubit(context).isPasswordConfirmRegister,
      onPressed: state is GlobalRegisterLoading
          ? () {}
          : () => _globalCubit(context).changeConfirmRegisterPassword(
              _globalCubit(context).isPasswordConfirmRegister),
    );
  }

  delayNavigator(context, state) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration.zero, () {
        showToastFromMixin(context, '$state');
      });
    });
  }

}
