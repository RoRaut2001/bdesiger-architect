import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Components/Buttons/submit_button.dart';

class Documents extends StatelessWidget {
  final AuthController controller;
  const Documents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600; // Define breakpoint for mobile layout

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: isMobile
          ? Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // CV Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload CV Here",
                  fileType: "CV",
                  filePath: controller.cvFilePath,
                  examplePath: 'assets/images/Services/cv.png',
                  controller: controller,
                ),
                // Portfolio Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload Portfolio Here",
                  fileType: "Portfolio",
                  filePath: controller.portfolioFilePath,
                  examplePath: 'assets/images/Services/portfolio.png',
                  controller: controller,
                ),
                // Certificate Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload the Certificate (optional)",
                  fileType: "Certificate",
                  filePath: controller.certificateFilePath,
                  examplePath: 'assets/images/Services/certificate.png',
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SubmitButton(
            title: "Continue",
            onTap: () {
              if (controller.pageIndex.value < 4) {
                controller.pageIndex.value += 1;
              } else {
                controller.registerArchitect(context);
              }
            },
            theme: "black",
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Two columns for desktop
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 6,
              children: [
                // CV Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload CV Here",
                  fileType: "CV",
                  filePath: controller.cvFilePath,
                  examplePath: 'assets/images/Services/cv.png',
                  controller: controller,
                ),
                // Portfolio Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload Portfolio Here",
                  fileType: "Portfolio",
                  filePath: controller.portfolioFilePath,
                  examplePath: 'assets/images/Services/portfolio.png',
                  controller: controller,
                ),
                // Certificate Section
                _buildDocumentUploadSection(
                  context,
                  title: "Upload the Certificate (optional)",
                  fileType: "Certificate",
                  filePath: controller.certificateFilePath,
                  examplePath: 'assets/images/Services/certificate.png',
                  controller: controller,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 200, // Fixed width for desktop
              child: SubmitButton(
                title: "Continue",
                onTap: () {
                  if (controller.pageIndex.value < 4) {
                    controller.pageIndex.value += 1;
                  } else {
                    controller.registerArchitect(context);
                  }
                },
                theme: "black",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentUploadSection(
      BuildContext context, {
        required String title,
        required String fileType,
        required Rx<XFile> filePath,
        required String examplePath,
        required AuthController controller,
      }) {
    return GestureDetector(
      onTap: () => controller.pickFile(fileType),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFEDEDED),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Obx(
                  () => filePath.value.path.isNotEmpty
                  ? Image.asset(
                examplePath, // Always show the example image
                height: 100,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Upload file"),
                    Icon(
                      Icons.file_copy,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
