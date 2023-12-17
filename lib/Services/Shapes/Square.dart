// ignore_for_file: unnecessary_this, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/pages/Custom_container.dart';
import 'package:or_calculator/pages/home.dart';

class MySquare extends MyShapes {
  double width = 0;
  final widthTextFiled = TextEditingController();

  // Constructor for Square
  MySquare(double a) {
    this.width = a;
  }

  @override
  double calculateArea() {
    double area = width * width;
    return area;
  }

  @override
  double get thickness {
    double thickness = width;
    return thickness;
  }

  @override
  void clearTextField() {
    widthTextFiled.clear();
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
              "Width",
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
                    controller: widthTextFiled,
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
                    onChanged: (widthTextFiled) {
                      if (isCustomerBuild) {
                        customerShapeData["width"] =
                            double.parse(widthTextFiled);
                      } else {
                        stockShapeData["width"] = double.parse(widthTextFiled);
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
