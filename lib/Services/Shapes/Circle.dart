// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'dart:math';
import 'package:or_calculator/pages/Custom_container.dart';
import 'package:or_calculator/pages/home.dart';

class MyCircle extends MyShapes {
  double diameter = 0;
  final diameterTextFiled = TextEditingController();

// Constructor for round
  MyCircle(double d) {
    diameter = d;
  }

  @override
  double calculateArea() {
    double area = pi * pow(diameter / 2, 2);
    return area;
  }

  @override
  double get thickness {
    double thickness = diameter;
    return thickness;
  }

  @override
  void clearTextField() {
    diameterTextFiled.clear();
  }

  @override
  TeXViewDocument showAreaFunctionLatex(int areaNumber) {
    String result = r"""$$A_""" +
        "{$areaNumber}" +
        r""" = \pi \cdot \left(\frac{D}{2}\right)^2$$""";
    return TeXViewDocument(result);
  }

  @override
  String showShapeInfo() {
    String info = "Circle $diameter [mm]";
    return info;
  }

  @override
  Widget buildWidget(BuildContext context, bool isCustomerBuild) {
    return SizedBox(
        height: MediaQuery.of(context).size.height *
            CustomContainer().containerHeight,
        width: MediaQuery.of(context).size.width *
            CustomContainer().containerWidth,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: MediaQuery.of(context).size.height *
                CustomContainer().containerHeight /
                CustomContainer().containerHeightForShapesType,
            width: MediaQuery.of(context).size.width *
                CustomContainer().containerWidth /
                CustomContainer().containerWidthForShapesType,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomContainer()
                    .containerInnerSideBorderRadius), // Adjust the radius as needed
                border: Border.all(
                  color: CustomContainer().outsideContainerColor,
                ),
                color: shapesContainerColor,
                boxShadow: [
                  containerShapesInfoShadow,
                ]),
            child: Center(
                child: Text(
              "Diameter",
              style: TextStyle(
                  fontSize: shapesAttributesTextSize,
                  fontFamily: shapesTextFont,
                  color: shapesTextColor),
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height *
                CustomContainer().containerHeight /
                CustomContainer().containerHeightForShapesData,
            width: MediaQuery.of(context).size.width *
                CustomContainer().containerWidth /
                CustomContainer().containerWidthForShapesData,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomContainer()
                    .containerInnerSideBorderRadius), // Adjust the radius as needed
                border: Border.all(
                  color: CustomContainer().outsideContainerColor,
                ),
                color: shapesInputBoxContainerColor,
                boxShadow: [
                  containerShapesInputBoxShadow,
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: diameterTextFiled,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      // You can add more formatters if needed
                    ],
                    style: TextStyle(
                        fontSize: shapesAttributesTextSize,
                        fontFamily: shapesInputBoxFont,
                        color: shapesTextColor),
                    textAlign: TextAlign.center,
                    maxLength: maxLengthForInputBox,
                    onChanged: (diameterTextFiled) {
                      if (isCustomerBuild) {
                        customerShapeData["diameter"] =
                            double.parse(diameterTextFiled);
                      } else {
                        stockShapeData["diameter"] =
                            double.parse(diameterTextFiled);
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(textFiledPadding),
                      hintText: textFiledHintText,
                      hintStyle: TextStyle(
                          fontSize: shapesAttributesTextSize,
                          fontFamily: shapesInputBoxFont,
                          color: shapesBoxHintColor),
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "mm",
                  style: TextStyle(
                      fontSize: shapesAttributesTextSize,
                      fontFamily: shapesTextFont,
                      color: shapesTextColor),
                ),
                SizedBox(width: sizeBoxWidth),
              ],
            ),
          )
        ]));
  }
}
