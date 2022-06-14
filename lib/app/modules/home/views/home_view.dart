import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenant_app/app/utils/constants.dart';

class HomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(color: kWhiteColor, fontSize: 24),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Set remainder'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Hello hello'),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
