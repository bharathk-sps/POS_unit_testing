import 'package:flutter/material.dart';

showloadingDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Loading, Please wait",
              ),
            ],
          ),
        );
      });
}
