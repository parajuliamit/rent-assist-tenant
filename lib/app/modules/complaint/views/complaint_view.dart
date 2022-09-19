import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "I") return Colors.red;
    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComplaintView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.error_outline,
                color: getColor("I"),
              ),
              title: Text('Complaints Title'),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text('Date'),
            ),
          );
        },
      ),
    );
  }
}
