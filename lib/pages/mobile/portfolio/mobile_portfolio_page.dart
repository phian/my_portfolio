import 'package:flutter/material.dart';

class MobilePortfolioPage extends StatefulWidget {
  const MobilePortfolioPage({Key? key}) : super(key: key);

  @override
  State<MobilePortfolioPage> createState() => _MobilePortfolioPageState();
}

class _MobilePortfolioPageState extends State<MobilePortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile portfolio page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
