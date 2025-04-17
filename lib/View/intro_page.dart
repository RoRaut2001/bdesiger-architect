// import 'dart:async';
// import 'package:b_designer_architecture/Constants/constant_color.dart';
// import 'package:b_designer_architecture/Helper/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// class IntroPage extends StatefulWidget {
//   @override
//   _IntroPageState createState() => _IntroPageState();
// }
//
// class _IntroPageState extends State<IntroPage> {
//   late VideoPlayerController _controller;
//   late Timer _timer;
//   double progress = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://drive.google.com/uc?export=download&id=1wwtoCbXxgd-K0ioFvypoXz4t2BLd2Y2V'))
//       ..initialize().then((_) {
//         setState(() {}); // Ensure the first frame is shown after initialization
//         _controller.play();
//         _startTimer();
//       });
//
//     // Dispose the video player and stop the timer on video end
//     _controller.addListener(() {
//       if (_controller.value.position == _controller.value.duration) {
//         _timer.cancel();
//         _navigateToLanding();
//       }
//     });
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
//       if (_controller.value.isInitialized) {
//         setState(() {
//           progress = _controller.value.position.inSeconds /
//               _controller.value.duration.inSeconds;
//         });
//       }
//     });
//   }
//
//   void _navigateToLanding() {
//     // Get.off(() => LandingPage(), transition: Transition.fadeIn);
//     _controller.dispose();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               // Video Player
//               SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : const Center(child: CircularProgressIndicator()),
//               ),
//               // Skip Button
//               Positioned(
//                 top: 8.h,
//                 right: 5.w,
//                 child: TextButton(
//                   onPressed: () {
//                     _timer.cancel();
//                     _navigateToLanding();
//                   },
//                   child: Text(
//                     "Skip",
//                     style: GoogleFonts.inter(
//                       fontSize: 20,
//                       decoration: TextDecoration.underline,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w600,
//                       decorationColor: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//               // Linear Progress Indicator
//               Positioned(
//                 top: 5.h,
//                 left: 0,
//                 right: 0,
//                 child: LinearProgressIndicator(
//                   value: progress,
//                   minHeight: 1.h,
//                   backgroundColor: kcGradient2,
//                   valueColor: AlwaysStoppedAnimation<Color>(kcMediumYellow),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
