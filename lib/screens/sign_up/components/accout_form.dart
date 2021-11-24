import 'package:application/screens/sign_up/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/components/default_button.dart';
import 'package:application/components/form_error.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AccountForm extends StatefulWidget {
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();
  String? id;
  String? password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserIDFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.3,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Hive.box('initApp').put('user_id', id);
                print("user_id : ${Hive.box('initApp').get('user_id')}");
                // if all are valid then go to success screen
                Get.toNamed(PasswordScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildUserIDFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => id = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kIDNullError);
        } else if (6 <= value.length && value.length <= 20) {
          removeError(error: kInvalidIdSizeError);
        } else if (idValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidIDCharError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kIDNullError);
          return "";
        } else if (!(6 <= value.length && value.length <= 20)) {
          addError(error: kInvalidIdSizeError);
          return "";
        } else if (!(idValidatorRegExp.hasMatch(value))) {
          print("has error: $kInvalidIDCharError");
          addError(error: kInvalidIDCharError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ID",
        hintText: "Enter your ID",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
