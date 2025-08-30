
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DealsController extends GetxController {

  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final experienceController = TextEditingController();
  final projectsController = TextEditingController();
  var selectedOption = 'Architectural Floor Plan'.obs;

  final List<String> designOptions = [
    'Architectural Floor Plan',
    '3D Elevation Design',
    'Interior Design',
    'Structural Design',
    'Electrical Design',
    'Plumbing Design',
  ];

  void updateSelection(String newValue) {
    selectedOption.value = newValue;
  }
}
