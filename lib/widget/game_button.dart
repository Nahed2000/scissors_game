import 'package:flutter/material.dart';

Widget gameButton({
  required String image,
  required double imageWidth,
  required void Function()onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(image,width: imageWidth,),


  );
}
