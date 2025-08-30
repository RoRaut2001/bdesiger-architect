import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../API/api_client.dart';
import '../../Controller/submission_controller.dart';

class ReportCardImagePicker extends StatelessWidget {
  final List<String>? imageUrls; // Existing backend images
  final RxList<MultipartBody>? imageList; // New images to upload
  final VoidCallback onPick;
  final VoidCallback onAdd;
  final double childAspectRatio;
  final int crossAxisCount;

  ReportCardImagePicker({
    super.key,
    required this.imageList,
    required this.onPick,
    required this.onAdd,
    this.childAspectRatio = 0.9,
    this.crossAxisCount = 4,
    this.imageUrls,
  });

  final SubmissionController controller = Get.find<SubmissionController>();

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1000;
        final gridCount = isWideScreen ? 5 : crossAxisCount;
        final itemWidth = constraints.maxWidth / gridCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Obx(() {
              final urlCount = imageUrls?.length ?? 0;
              final localCount = imageList?.length ?? 0;
              final totalCount = urlCount + localCount + 1; // +1 for Add button

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 16/9,
                ),
                itemCount: totalCount,
                itemBuilder: (_, i) {
                  if (i < urlCount) {
                    return _buildUrlCard(imageUrls![i], i);
                  } else if (i < urlCount + localCount) {
                    return _buildLocalCard(imageList![i - urlCount], i - urlCount);
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
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: const Center(child: Icon(Icons.add, size: 30)),
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

  Widget _buildLocalCard(MultipartBody data, int index, {double? height}) {
    return Container(
      height: height,
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
              onTap: () => imageList?.removeAt(index),
              child: _deleteIcon("local"),
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
            child: Builder(
                builder: (context) {
                  return GestureDetector(
                    child: _deleteIcon("url"),
                    //TODO Add popover
                  );
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget _deleteIcon(String type) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child:  type == "url" ? Icon(Icons.more_vert_rounded, size: 16,) : Icon(Icons.close, size: 16),
    );
  }
}
