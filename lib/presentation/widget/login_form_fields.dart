import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/show_toast_mixin.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/password_icon.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/row_of_buttons.dart';
import '../../constants/constants_values.dart';
import 'custom_form_field.dart';
import 'loading_widget.dart';
import 'mixin_delay_navigator.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields({Key? key}) : super(key: key);

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields>
    with DelayNavigator, ShowToastMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _globalCubit(context).loginUser(
          _emailController.text.trim(), _passwordController.text.trim());
      _formKey.currentState!.save();
    }
    _formKey.currentState!.save();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalStates>(
      listener: (context, state) {
        if (state is GlobalLoginSuccess) {
          showToastFromMixin(context, 'Login Successfully');
        }
        if (state is GlobalLoginError) {
          showToastFromMixin(context, translate('error Toast'));
        }
      },
      builder: (context, state) {
        if (state is GlobalLoginSuccess) {
          if (state.accountModel.status == 200) {
            delayedNavigator(context, state.accountModel.accountModels);
          }
        }
        if (state is GlobalLoginLoading) {
          return const LoadingWidget();
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        controller: _passwordController,
                        hintText: translate('password'),
                        obscureText:
                            _globalCubit(context).isPasswordLogin,
                        suffixIcon:onIconPassword(context, state),
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return translate('passwordValidation');
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                RowOfButtons(
                    onPressedRegister: () => Navigator.pushReplacementNamed(
                        context, Constants.registerUserScreen),
                    onPressedLogin: () => _onLogin()),
              ],
          ),
        );
      },
    );
  }

  GlobalCubit _globalCubit(context) => BlocProvider.of(context);

  PasswordIcon onIconPassword(context, state) {
    return PasswordIcon(
      isPassword: _globalCubit(context).isPasswordLogin,
      onPressed: state is GlobalLoginLoading
          ? () {}
          : () => _globalCubit(context)
              .changeLoginPassword(_globalCubit(context).isPasswordLogin),
    );
  }
}
