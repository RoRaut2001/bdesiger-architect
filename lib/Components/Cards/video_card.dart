import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoCard extends StatefulWidget {
  final String videoUrl;
  const VideoCard({super.key, required this.videoUrl});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late final player = Player(
    configuration: PlayerConfiguration(
      muted: true,
    )
  );
  late final controller = VideoController(
      player,
    configuration: VideoControllerConfiguration(
    )
  );

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.videoUrl));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      child: Video(controller: controller,
        aspectRatio: 16/9,
        fit: BoxFit.cover,
      ),
    );
  }
}
