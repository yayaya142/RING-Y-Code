// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/pages/Custom_container.dart';
import 'dart:math';

import 'package:or_calculator/pages/home.dart';

class MySemiCircle extends MyShapes {
  double diameter = 0;
  final diameterTextFiled = TextEditingController();

// Constructor for SemiRound
  MySemiCircle(double d) {
    diameter = d;
  }

  @override
  double calculateArea() {
    double area = (pi * pow(diameter / 2, 2)) / 2;
    return area;
  }

  @override
  double get thickness {
    double thickness = diameter / 2;
    return thickness;
  }

  @override
  void clearTextField() {
    diameterTextFiled.clear();
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
            ),
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
              color: shapesContainerColor,
            ),
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
                    maxLength: 8,
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
                          color: shapesTextColor),
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
