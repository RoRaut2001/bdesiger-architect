import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../API/api_client.dart';
import '../../Controller/submission_controller.dart';

class ReportCardImagePickerMobile extends StatelessWidget {
  final List<String>? imageUrls;
  final RxList<MultipartBody> imageList;
  final VoidCallback onPick;
  final VoidCallback onAdd;
  final double childAspectRatio;
  final int crossAxisCount;

  ReportCardImagePickerMobile({
    super.key,
    required this.imageList,
    required this.onPick,
    required this.onAdd,
    this.childAspectRatio = 1.0,
    this.crossAxisCount = 3,
    this.imageUrls,
  });

  final SubmissionController controller = Get.find<SubmissionController>();

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 600;
        final gridCount = isWideScreen ? 4 : crossAxisCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Obx(() {
              final urlCount = imageUrls?.length ?? 0;
              final localCount = imageList.length;
              final totalCount = urlCount + localCount + 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: totalCount,
                itemBuilder: (_, i) {
                  if (i < urlCount) {
                    return _buildUrlCard(imageUrls![i], i);
                  } else if (i < urlCount + localCount) {
                    return _buildLocalCard(imageList[i - urlCount], i - urlCount);
                  } else {
                    return _buildAddButton(controller, context);
                  }
                },
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildAddButton(SubmissionController controller, BuildContext context) {
    return GestureDetector(
      onTap: () => _showAddDialog(controller, context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: const Center(child: Icon(Icons.add_a_photo, size: 26)),
      ),
    );
  }

  void _showAddDialog(SubmissionController controller, BuildContext context) {
    controller.tempWebBytes.value = null;
    controller.tempMobileFile.value = null;

    Get.defaultDialog(
      title: "Add Image",
      content: Column(
        children: [
          GestureDetector(
            onTap: onPick,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Obx(() {
                if (kIsWeb && controller.tempWebBytes.value != null) {
                  return Image.memory(
                    controller.tempWebBytes.value!,
                    fit: BoxFit.cover,
                  );
                } else if (!kIsWeb && controller.tempMobileFile.value != null) {
                  return Image.file(
                    File(controller.tempMobileFile.value!.path),
                    fit: BoxFit.cover,
                  );
                } else {
                  return const Center(child: Icon(Icons.add_a_photo, size: 40));
                }
              }),
            ),
          ),
        ],
      ),
      textCancel: 'Cancel',
      textConfirm: 'Add',
      confirmTextColor: Colors.white,
      onConfirm: () {
        final hasImage = kIsWeb
            ? controller.tempWebBytes.value != null
            : controller.tempMobileFile.value != null;

        if (!hasImage) {
          Get.snackbar(
            'Missing Image',
            'Please select an image before adding.',
            backgroundColor: Colors.red.shade200,
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        onAdd();
        Get.back();
      },
    );
  }

  Widget _buildLocalCard(MultipartBody data, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: (kIsWeb && data.webBytes != null)
                ? Image.memory(data.webBytes!, fit: BoxFit.cover, width: double.infinity)
                : (!kIsWeb && data.file != null)
                ? Image.file(File(data.file!.path), fit: BoxFit.cover, width: double.infinity)
                : const Center(child: Icon(Icons.broken_image)),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: () => imageList.removeAt(index),
              child: _deleteIcon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUrlCard(String imageUrl, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
              const Center(child: Icon(Icons.broken_image)),
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: () {
                // Optional: Handle image actions
              },
              child: _deleteIcon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deleteIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: Icon(icon, size: 16),
    );
  }
}
