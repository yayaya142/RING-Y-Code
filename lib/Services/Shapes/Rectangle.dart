// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/pages/Custom_container.dart';
import 'package:or_calculator/pages/home.dart';

class MyRectangle extends MyShapes {
  double sideA = 0;
  double sideB = 0;
  // Constructor for Rectangle

  MyRectangle(double a, double b) {
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
                            onChanged: (value) {
                              if (isCustomerBuild) {
                                customerShapeData["width"] =
                                    double.parse(value);
                              } else {
                                stockShapeData["width"] = double.parse(value);
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
                            onChanged: (value) {
                              if (isCustomerBuild) {
                                customerShapeData["thickness"] =
                                    double.parse(value);
                              } else {
                                stockShapeData["thickness"] =
                                    double.parse(value);
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
