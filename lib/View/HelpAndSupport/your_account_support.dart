import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/Data/setter_fields.dart';

class YourAccountSupport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        Map<String, List<Map<String, String>>> groupedData = {};
        for (var item in yourAccountSupport) {
          String title = item['title']!;
          if (!groupedData.containsKey(title)) {
            groupedData[title] = [];
          }
          groupedData[title]!.add(item);
        }

        return ListView(
          children: groupedData.entries.map((entry) {
            String title = entry.key;
            List<Map<String, String>> items = entry.value;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                children: items.map((faq) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          faq['question']!,
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          // Show dialog or navigate to answer
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(faq['question']!),
                              content: Text(faq['answer']!),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(height: 1),
                    ],
                  );
                }).toList(),
              ),
            );
          }).toList(),
        );
      }
    );
  }
}
