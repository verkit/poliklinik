import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poli_app/controllers/auth.dart';

class CheckScreen extends GetView<AuthController> {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.user.value!.phoneNumber!),
      ),
      body: Container(),
    );
  }
}
