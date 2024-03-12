import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UiHelper extends GetxController {
  static customButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            voidCallback();
          },
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          )),
    );
  }
}
