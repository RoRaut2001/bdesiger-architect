import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../API/api_client.dart';
import '../../Controller/submission_controller.dart';

class ReportCardFilePickerMobile extends StatelessWidget {
  final List<String>? fileUrls; // existing remote file links
  final RxList<MultipartBody> fileList; // new files to upload
  final VoidCallback onPick;
  final VoidCallback onAdd;
  final double childAspectRatio;
  final int crossAxisCount;

  ReportCardFilePickerMobile({
    super.key,
    required this.fileList,
    required this.onPick,
    required this.onAdd,
    this.childAspectRatio = 2.3,
    this.crossAxisCount = 4,
    this.fileUrls,
  });

  final SubmissionController controller = Get.find<SubmissionController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1000;
        final gridCount = isWideScreen ? 5 : crossAxisCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Obx(() {
              final urlCount = fileUrls?.length ?? 0;
              final localCount = fileList.length;
              final totalCount = urlCount + localCount + 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: totalCount,
                itemBuilder: (_, i) {
                  if (i < urlCount) {
                    return _buildUrlCard(fileUrls![i]);
                  } else if (i < urlCount + localCount) {
                    return _buildFileCard(fileList[i - urlCount], i - urlCount);
                  } else {
                    return _buildAddButton(controller);
                  }
                },
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildAddButton(SubmissionController controller) {
    return GestureDetector(
      onTap: () => _showAddDialog(controller),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: const Center(child: Icon(Icons.upload_file, size: 18)),
      ),
    );
  }

  void _showAddDialog(SubmissionController controller) {
    controller.tempPickedFile.value = null;
    controller.tempFileWebBytes.value = null;

    Get.defaultDialog(
      title: "Upload File",
      content: Column(
        children: [
          ElevatedButton.icon(
            onPressed: onPick,
            icon: const Icon(Icons.attach_file),
            label: const Text("Choose File"),
          ),
          const SizedBox(height: 10),
          Obx(() {
            final file = controller.tempPickedFile.value;
            if (file != null) {
              return Column(
                children: [
                  const Icon(Icons.insert_drive_file, size: 40, color: Colors.blue),
                  const SizedBox(height: 5),
                  Text(file.name, style: const TextStyle(fontSize: 13)),
                ],
              );
            }
            return const Text("No file selected");
          }),
        ],
      ),
      textCancel: 'Cancel',
      textConfirm: 'Add',
      confirmTextColor: Colors.white,
      onConfirm: () {
        final file = controller.tempPickedFile.value;
        if (file == null || file.bytes == null) {
          Get.snackbar("Missing", "Please select a valid file",
              backgroundColor: Colors.red[200], colorText: Colors.black);
          return;
        }
        onAdd();
        Get.back();
      },
    );
  }

  Widget _buildFileCard(MultipartBody data, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.insert_drive_file, size: 24, color: Colors.black54),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    data.filename ?? data.key,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: () => fileList.removeAt(index),
              child: _deleteIcon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUrlCard(String fileUrl) {
    final fileName = fileUrl.split('/').last;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.insert_drive_file, size: 24, color: Colors.blue),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    fileName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: () {
                // Optional: Show menu or download
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
      child: Icon(icon, size: 14),
    );
  }
}
