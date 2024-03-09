import 'package:flutter/material.dart';
import 'package:my_properties/constants/constants.dart';

class FullScreenImage extends StatelessWidget {
  final String? imagePath;

  const FullScreenImage({Key? key, @required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath!,
          child: Image.asset(
            imagePath!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
