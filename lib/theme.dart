import 'package:flutter/material.dart';
import 'package:or_calculator/pages/home.dart';

class ThemeColors {
// app bar colors
  Color appBarColor = const Color.fromARGB(255, 0, 0, 0);
// body colors
  Color primaryBackgroundColor = Color(0xff7a6161);
  Color secondaryBackgroundColor = Colors.blue;
  Color backgroundContainerColor = Colors.white;
  // fonts
  String bodyFont = 'Poppins';
  String shapesFont = 'Poppins';
  String shapesInputBoxFont = 'Poppins';
  String resultBoxFont = 'Poppins';

// headLine style
  TextStyle headLineTextStyle = const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: Colors.black, // You can set the underline color
      decorationThickness: 1.5,
      fontSize: shapeHeadlineSize,
      fontFamily: 'Poppins',
      color: Colors.black,
      fontWeight: FontWeight.bold);

  // Text colors
  Color bodyTextColor = Colors.black;
  Color shapesTextColor = Colors.black;
  Color resultBoxTextColor = Colors.black;
  Color resultBoxTextVariables = Colors.black;
  Color shapesBoxHintColor = Colors.black.withOpacity(0.5);

  // container colors
  Color menuContainerColor = Colors.grey[400]!;
  Color shapesContainerColor = Colors.grey[300]!;
  Color shapesInputBoxContainerColor = Colors.grey[300]!;
  Color resultContainerColor = Colors.orange[100]!;

  //  calculator button colors
  Color calculatorButtonColor = Colors.grey;
  Color calculatorButtonBorder = Colors.black;
  Color calculatorButtonTextColor = Colors.black;
  // Show more button
  Color showMoreTextColor = Colors.black;
  String showMoreFont = '';

  // Container Shadow
  BoxShadow containerMenuShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 3), // changes position of shadow
  );
  BoxShadow containerShapesInfoShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 3), // changes position of shadow
  );
  BoxShadow containerShapesInputBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 3), // changes position of shadow
  );
}


// const color = const Color(0xffb74093); // Second `const` is optional in assignments.
