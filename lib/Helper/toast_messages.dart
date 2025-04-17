import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';



void showSuccess(BuildContext context, String message){
  toastification.show(
    context: context,
    type: ToastificationType.success,
    title: Text(message, style: TextStyle(
      fontSize: 1.t,
      color: Colors.black
    ),),
    style: ToastificationStyle.flat,
    showProgressBar: false,
    dismissDirection: DismissDirection.horizontal,
    direction: TextDirection.rtl
  );
}

void showError(BuildContext context, String message){
  toastification.show(
    context: context,
    type: ToastificationType.error,
    title: Text(message, style: TextStyle(
      fontSize: 1.t,
      color: Colors.black
    ),),
    style: ToastificationStyle.flat,
    showProgressBar: false,
    dismissDirection: DismissDirection.horizontal,
    direction: TextDirection.rtl
  );
}

void showWarning(BuildContext context, String message){
  toastification.show(
    context: context,
    type: ToastificationType.warning,
    title: Text(message, style: TextStyle(
      fontSize: 1.t,
      color: Colors.black
    ),),
    style: ToastificationStyle.flat,
    showProgressBar: false,
    dismissDirection: DismissDirection.horizontal,
    direction: TextDirection.rtl
  );
}

void showInfo(BuildContext context, String message){
  toastification.show(
    context: context,
    type: ToastificationType.info,
    title: Text(message, style: TextStyle(
      fontSize: 1.t,
      color: Colors.black
    ),),
    style: ToastificationStyle.flat,
    showProgressBar: false,
    dismissDirection: DismissDirection.horizontal,
    direction: TextDirection.rtl
  );
}