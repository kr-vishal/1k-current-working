// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class document extends StatefulWidget {
  const document({Key? key}) : super(key: key);

  @override
  State<document> createState() => _documentState();
}

class _documentState extends State<document> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('document')),
    );
  }
}
