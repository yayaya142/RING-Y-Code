// ignore_for_file: file_names, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/pages/Custom_container.dart';
import 'package:or_calculator/pages/home.dart';

class MyHexagon extends MyShapes {
  double rib = 0;
  final ribTextFiled = TextEditingController();

  // Constructor for Hexagon
  MyHexagon(double a) {
    rib = a;
  }

  @override
  double calculateArea() {
    double area = (3 * sqrt(3) / 2) * pow(rib, 2);
    return area;
  }

  @override
  double get thickness {
    double thickness = rib;
    return thickness;
  }

  @override
  void clearTextField() {
    ribTextFiled.clear();
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
            ),
            child: Center(
                child: Text(
              "Rib",
              style: TextStyle(fontSize: shapesAttributesTextSize),
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
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ribTextFiled,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      // You can add more formatters if needed
                    ],
                    style: TextStyle(fontSize: shapesAttributesTextSize),
                    textAlign: TextAlign.center,
                    maxLength: 8,
                    onChanged: (ribTextFiled) {
                      if (isCustomerBuild) {
                        customerShapeData["width"] = double.parse(ribTextFiled);
                      } else {
                        stockShapeData["width"] = double.parse(ribTextFiled);
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(textFiledPadding),
                      hintText: textFiledHintText,
                      hintStyle: TextStyle(fontSize: shapesAttributesTextSize),
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "mm",
                  style: TextStyle(fontSize: shapesAttributesTextSize),
                ),
                SizedBox(width: sizeBoxWidth),
              ],
            ),
          )
        ]));
  }
}
