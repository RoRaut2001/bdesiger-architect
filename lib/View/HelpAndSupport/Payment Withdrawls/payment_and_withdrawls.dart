import 'package:b_designer_architecture/Controller/help_and_support_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PaymentAndWithdrawals extends StatelessWidget {
  PaymentAndWithdrawals({super.key});

  final HelpAndSupportController controller = Get.find<HelpAndSupportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final designPackage = controller.architectSettings.value.needHelpPage?.designPackage;
        return Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: designPackage == null || designPackage.isEmpty
                  ? [const Text("No queries available.")]
                  : List.generate(designPackage.length, (index) {
                final section = designPackage[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      section.title ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ...?section.qas?.map((qa) => Column(
                      children: [
                        ExpansionTile(
                          backgroundColor: Colors.white,
                          collapsedBackgroundColor: Colors.white,
                          collapsedShape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none
                          ),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none
                          ),
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          title: Text("${qa.question ?? ''}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 14
                            ),
                          ),
                          childrenPadding: const EdgeInsets.all(10),
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${qa.answer ?? ''}",
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    )),
                    // if (index != designPackage.length - 1)
                    //   Center(
                    //     child: Container(
                    //       width: 300,
                    //       child: const Divider(
                    //         height: 40,
                    //         color: Colors.black,
                    //         thickness: 0.5,
                    //       ),
                    //     ),
                    //   ),
                  ],
                );
              }),
            ),
          ),
        );
      }
    });
  }
}
