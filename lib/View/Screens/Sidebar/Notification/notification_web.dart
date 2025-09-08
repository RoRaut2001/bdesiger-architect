import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationModel {
  final String title;
  final String subtitle;
  final String url;
  final String image;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.image,
  });
}

class NotificationWeb extends StatelessWidget {
  const NotificationWeb({super.key});

  static final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Sydney Opera House",
      subtitle: "Architectural Icon of Australia",
      url: "https://www.sydneyoperahouse.com/",
      image:
      "https://res.cloudinary.com/dculivch8/image/upload/v1751448384/interior-2d-details_wz0rsb.png",
    ),
    NotificationModel(
      title: "Eiffel Tower",
      subtitle: "Paris Engineering Marvel",
      url: "https://www.toureiffel.paris/",
      image:
      "https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg",
    ),
    NotificationModel(
      title: "Statue of Unity",
      subtitle: "World’s Tallest Statue, India",
      url: "https://statueofunity.in/",
      image:
      "https://res.cloudinary.com/dculivch8/image/upload/v1751441567/interior-singleroom_f5gkub.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 10 / 9,
        ),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      item.url,
                      style: GoogleFonts.roboto(
                        color: Colors.blue,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
