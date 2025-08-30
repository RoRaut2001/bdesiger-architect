import 'package:get/get.dart';
import 'dart:typed_data';

class PaintItem {
  String name;
  String code;
  Uint8List? image;

  PaintItem({required this.name, required this.code, this.image});
}

class SubtitleSection {
  String subtitle;
  RxList<PaintItem> paints = <PaintItem>[].obs;

  SubtitleSection({required this.subtitle});
}

class ExteriorPaintTitle {
  String title;
  RxList<SubtitleSection> subtitles = <SubtitleSection>[].obs;

  ExteriorPaintTitle({required this.title});
}

class ExteriorPaintsController extends GetxController {
  var paintTitles = <ExteriorPaintTitle>[].obs;

  void addTitle(String title) {
    paintTitles.add(ExteriorPaintTitle(title: title));
  }

  void addSubtitle(int titleIndex, String subtitle) {
    paintTitles[titleIndex].subtitles.add(SubtitleSection(subtitle: subtitle));
  }

  void addPaintItem(int titleIndex, int subtitleIndex, PaintItem item) {
    paintTitles[titleIndex].subtitles[subtitleIndex].paints.add(item);
  }
}