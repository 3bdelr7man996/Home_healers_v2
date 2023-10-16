import 'package:flutter/material.dart';

class VerificationCodeForm extends StatelessWidget {
  final List controllers;

  const VerificationCodeForm({Key? key, required this.controllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < controllers.length; i++)
            Container(
              width: 50,
              height: 50,
              child: TextFormField(
                controller: controllers[i],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.all(10.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
