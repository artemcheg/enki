import 'package:flutter/material.dart';

class ServiceInfo extends StatelessWidget {
final String text;
  const ServiceInfo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(text),));
  }
}
