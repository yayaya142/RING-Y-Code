// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/pages/Custom_container.dart';
import 'package:or_calculator/pages/home.dart';

class MySheet extends MyShapes {
  double sideA = 0;
  double sideB = 0;
  final widthTextFiled = TextEditingController();
  final thicknessTextFiled = TextEditingController();
  // Constructor for Sheet

  MySheet(double a, double b) {
    sideA = a;
    sideB = b;
  }

  @override
  double calculateArea() {
    double area = sideA * sideB;
    return area;
  }

  @override
  double get thickness {
    double thickness = sideB;
    return thickness;
  }

  @override
  void clearTextField() {
    widthTextFiled.clear();
    thicknessTextFiled.clear();
  }

  @override
  Widget buildWidget(BuildContext context, bool isCustomerBuild) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height *
                CustomContainer().containerHeight,
            width: MediaQuery.of(context).size.width *
                CustomContainer().containerWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      "Width",
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
                            controller: widthTextFiled,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d*')),
                              // You can add more formatters if needed
                            ],
                            style:
                                TextStyle(fontSize: shapesAttributesTextSize),
                            textAlign: TextAlign.center,
                            maxLength: 8,
                            onChanged: (widthTextFiled) {
                              if (isCustomerBuild) {
                                customerShapeData["width"] =
                                    double.parse(widthTextFiled);
                              } else {
                                stockShapeData["width"] =
                                    double.parse(widthTextFiled);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(textFiledPadding),
                              hintText: textFiledHintText,
                              hintStyle:
                                  TextStyle(fontSize: shapesAttributesTextSize),
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
                ])),
        SizedBox(
            height: MediaQuery.of(context).size.height *
                CustomContainer().containerHeight,
            width: MediaQuery.of(context).size.width *
                CustomContainer().containerWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      "Thickness",
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
                            controller: thicknessTextFiled,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d*')),
                              // You can add more formatters if needed
                            ],
                            style:
                                TextStyle(fontSize: shapesAttributesTextSize),
                            textAlign: TextAlign.center,
                            maxLength: 8,
                            onChanged: (thicknessTextFiled) {
                              if (isCustomerBuild) {
                                customerShapeData["thickness"] =
                                    double.parse(thicknessTextFiled);
                              } else {
                                stockShapeData["thickness"] =
                                    double.parse(thicknessTextFiled);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(textFiledPadding),
                              hintText: textFiledHintText,
                              hintStyle:
                                  TextStyle(fontSize: shapesAttributesTextSize),
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
                ])),
      ],
    );
  }
}
