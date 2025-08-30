import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';

import '../../../Controller/exterior_paint_controller.dart';

class ExteriorPaintsCard extends StatelessWidget {
  final ExteriorPaintsController controller;

  ExteriorPaintsCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header("Exterior Paint", () => _showTitleDialog(context)),
        const SizedBox(height: 20),
        ...List.generate(controller.paintTitles.length, (i) {
          final title = controller.paintTitles[i];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionBox(title.title,
                  onAdd: () => _showSubtitleDialog(context, i)),
              const SizedBox(height: 10),
              ...List.generate(title.subtitles.length, (j) {
                final subtitle = title.subtitles[j];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionBox(subtitle.subtitle,
                        onAdd: () => _showPaintItemDialog(context, i, j)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(subtitle.paints.length, (k) {
                        final paint = subtitle.paints[k];
                        return _paintCard(paint);
                      }),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }),
              const SizedBox(height: 30),
            ],
          );
        })
      ],
    ));
  }

  Widget _header(String title, VoidCallback onAdd) => Row(
    children: [
      Text(title,
          style:
          GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(width: 10),
      IconButton(onPressed: onAdd, icon: const Icon(Icons.add))
    ],
  );

  Widget _sectionBox(String text, {required VoidCallback onAdd}) => Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(text,
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
      const SizedBox(width: 10),
      IconButton(
          onPressed: onAdd, icon: const Icon(Icons.add_circle_outline))
    ],
  );

  Widget _paintCard(PaintItem item) => Container(
    width: 250,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black26),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(item.code, style: GoogleFonts.inter(fontSize: 13)),
          ],
        ),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white, // White background container
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          height: 80,
          width: 80,
          clipBehavior: Clip.hardEdge, // Ensures child respects radius
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
            ),
            child: item.image != null
                ? Image.memory(
              item.image!,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            )
                : Container(
              color: Colors.grey[400],
              child: const Icon(Icons.image, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    hintStyle: GoogleFonts.inter(),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1.5),
    ),
  );

  void _showTitleDialog(BuildContext context) {
    final controllerText = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Add Title", style: GoogleFonts.inter()),
        content: TextField(
          controller: controllerText,
          decoration: _inputDecoration('Enter title'),
          cursorColor: Colors.black,
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.addTitle(controllerText.text.trim());
              Get.back();
            },
            child: Text("Add", style: GoogleFonts.inter()),
          )
        ],
      ),
    );
  }

  void _showSubtitleDialog(BuildContext context, int titleIndex) {
    final controllerText = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Add Subtitle", style: GoogleFonts.inter()),
        content: TextField(
          controller: controllerText,
          decoration: _inputDecoration('Enter subtitle'),
          cursorColor: Colors.black,
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.addSubtitle(titleIndex, controllerText.text.trim());
              Get.back();
            },
            child: Text("Add", style: GoogleFonts.inter()),
          )
        ],
      ),
    );
  }

  void _showPaintItemDialog(
      BuildContext context, int titleIndex, int subtitleIndex) async {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    Uint8List? imageBytes;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Add Paint", style: GoogleFonts.inter()),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: _inputDecoration('Paint Name'),
                  cursorColor: Colors.black,
                  style: GoogleFonts.inter(),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: codeController,
                  decoration: _inputDecoration('Paint Code'),
                  cursorColor: Colors.black,
                  style: GoogleFonts.inter(),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      imageBytes = await image.readAsBytes();
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.upload),
                  label: Text("Upload Color Image", style: GoogleFonts.inter()),
                ),
                const SizedBox(height: 10),
                if (imageBytes != null)
                  Image.memory(imageBytes!, height: 100, width: 100),
              ],
            ),
          ),
          actions: [
            InkWell(
                onTap: () {
                  controller.addPaintItem(
                    titleIndex,
                    subtitleIndex,
                    PaintItem(
                      name: nameController.text.trim(),
                      code: codeController.text.trim(),
                      image: imageBytes,
                    ),
                  );
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Add",
                      style: GoogleFonts.inter(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }
}
