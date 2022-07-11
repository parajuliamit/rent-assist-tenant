import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';

import '../controllers/saved_payment_controller.dart';

class SavedPaymentView extends GetView<SavedPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Payments'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                // controller: editingController,
                decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Enter Payment name",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  // focusColor: kPrimaryColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        Icons.paid_outlined,
                        color: kPrimaryColor,
                      ),
                      title: Text('Paid upto the month of Ashad.'),
                      trailing: Icon(Icons.chevron_right),
                      subtitle: Text('2079/02/30'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
