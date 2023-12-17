// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/DropDownDataBase.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/Services/Shapes/defaultShape.dart';
import 'package:or_calculator/Services/calculator.dart';
import 'package:or_calculator/pages/ShowFormula.dart';
import 'package:or_calculator/pages/custom_container.dart';
import 'package:or_calculator/pages/homeShapes.dart';
import 'package:or_calculator/theme.dart';
import 'package:flutter_tex/flutter_tex.dart';

// Home Page variables for shapes
const double allSizePadding = 15.0;
const double sizeBoxHeight = 10;
const double sizeBoxWidth = 15;
const double shapeSizeBoxHeight = 5;
const double calculateButtonWidth = 0.6;
const double calculateButtonHeight = 0.04;
const String resultBoxSpacing = "     ";
// Page Text
const double innerBoxTextSize = 17;
const double shapesAttributesTextSize = 15;
const double resultBoxTextSize = 14;
// headline size and color
const double shapeHeadlineSize = 20;

// shapes values
Map<String, dynamic> customerShapeData = {
  'shape': "",
  'diameter': 0.0,
  'width': 0.0,
  'thickness': 0.0,
  'ringSize': 0.0,
  'ringMetalType': ""
};

Map<String, dynamic> stockShapeData = {
  'shape': "",
  'diameter': 0.0,
  'width': 0.0,
  'thickness': 0.0
};

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // store the value for the calculation
  List<dynamic> result = [];

  // calculator result
  String showSteps = "No steps to show";
  double customerShapeLength = 0.0;
  double stockShapeLength = 0.0;
  double stockShapeWeight = 0.0;
  bool resultError = false;
  bool showOnlyCustomerLength = false;
  // DropDown Menus
  String? selectedMetalType;
  String? selectedShapeCustomer;
  String? selectedShapeStock;
  double? selectedSize;

// default shape object
  MyShapes customerObjectShapeGUI = DefaultShape();
  MyShapes stockObjectShapeGUI = DefaultShape();

  void resetShapeData(bool customerData) {
    resetResult();

    if (customerData) {
      customerShapeData['diameter'] = 0.0;
      customerShapeData['width'] = 0.0;
      customerShapeData['thickness'] = 0.0;
    } else {
      stockShapeData['diameter'] = 0.0;
      stockShapeData['width'] = 0.0;
      stockShapeData['thickness'] = 0.0;
    }
  }

  void resetResult() {
    customerShapeLength = 0.0;
    stockShapeLength = 0.0;
    stockShapeWeight = 0.0;
    showSteps = "No steps to show";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ring Wire Converter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeColors().appBarColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(allSizePadding),
              child: Column(
                children: [
                  Text(
                    'Ring Wire',
                    style: TextStyle(
                        fontSize: shapeHeadlineSize,
                        fontFamily: ThemeColors().headLineFont,
                        color: ThemeColors().headLineTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          CustomContainer().containerHeight,
                      width: MediaQuery.of(context).size.width *
                          CustomContainer().containerWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(CustomContainer()
                              .containerInnerSideBorderRadius), // Adjust the radius as needed
                          border: Border.all(
                            color: CustomContainer().outsideContainerColor,
                          ),
                          color: ThemeColors().menuContainerColor),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        // icon: SizedBox.shrink(),
                        underline: Container(),
                        value: selectedMetalType,
                        hint: Center(
                            child: Text(
                          'Metal Type',
                          style: TextStyle(
                              fontSize: innerBoxTextSize,
                              color: ThemeColors().bodyTextColor,
                              fontFamily: ThemeColors().bodyFont),
                        )), // Add a hint here
                        onChanged: (String? newValue) {
                          resetResult();
                          setState(() {
                            selectedMetalType = newValue!;
                            if (selectedMetalType != null) {
                              customerShapeData['ringMetalType'] =
                                  selectedMetalType!.toString();
                            }
                          });
                        },
                        items: MetalOptionsDropDown.metal.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: innerBoxTextSize,
                                    fontFamily: ThemeColors().bodyFont,
                                    color: ThemeColors().bodyTextColor),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          CustomContainer().containerHeight,
                      width: MediaQuery.of(context).size.width *
                          CustomContainer().containerWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(CustomContainer()
                            .containerInnerSideBorderRadius), // Adjust the radius as needed
                        border: Border.all(
                          color: CustomContainer().outsideContainerColor,
                        ),
                        color: ThemeColors().menuContainerColor,
                      ),
                      child: DropdownButton<double>(
                        isExpanded: true,
                        // icon: SizedBox.shrink(),
                        underline: Container(),
                        value: selectedSize, // currently selected value
                        hint: Center(
                            child: Text(
                          'Size US',
                          style: TextStyle(
                              fontSize: innerBoxTextSize,
                              color: ThemeColors().bodyTextColor,
                              fontFamily: ThemeColors().bodyFont),
                        )), // Add a hint here

                        items: SizeOptionsDropDown.sizes.map((size) {
                          return DropdownMenuItem<double>(
                            value: size, // value associated with the menu item
                            child: Center(
                              child: Text(
                                "${size.toString()}  US",
                                style: TextStyle(
                                    fontSize: innerBoxTextSize,
                                    color: ThemeColors().bodyTextColor,
                                    fontFamily: ThemeColors().bodyFont),
                              ),
                            ), // displayed text
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          resetResult();
                          setState(() {
                            selectedSize = newValue!;
                            if (selectedSize != null) {
                              customerShapeData['ringSize'] = selectedSize;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        CustomContainer().containerHeight,
                    width: MediaQuery.of(context).size.width *
                        CustomContainer().containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(CustomContainer()
                          .containerInnerSideBorderRadius), // Adjust the radius as needed
                      border: Border.all(
                        color: CustomContainer().outsideContainerColor,
                      ),
                      color: ThemeColors().menuContainerColor,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // icon: SizedBox.shrink(),
                      underline: Container(),
                      value: selectedShapeCustomer,
                      hint: Center(
                          child: Text(
                        'Shape',
                        style: TextStyle(
                            fontSize: innerBoxTextSize,
                            color: ThemeColors().bodyTextColor,
                            fontFamily: ThemeColors().bodyFont),
                      )), // Add a hint here
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedShapeCustomer = newValue!;
                          // reset the shape data
                          resetShapeData(true);
                          customerObjectShapeGUI.clearTextField();
                          if (selectedShapeCustomer != null) {
                            customerShapeData["shape"] =
                                selectedShapeCustomer.toString();
                            customerObjectShapeGUI = CreateShapeObject()
                                .createShape(
                                    customerShapeData["shape"], 0, 0, 0);
                          }
                        });
                      },
                      items: ShapeOptionsDropDown.shapes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: innerBoxTextSize,
                                    color: ThemeColors().bodyTextColor,
                                    fontFamily: ThemeColors().bodyFont)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: shapeSizeBoxHeight,
                  ),
                  customerObjectShapeGUI.buildWidget(context, true),
                  Center(
                    child: Transform.rotate(
                      angle: 3.14 / 2,
                      child: Icon(
                        Icons.forward,
                        size: MediaQuery.of(context).size.width *
                            0.12, // Adjust the size as needed
                        color: Colors.blue, // Change the color if desired
                      ),
                    ),
                  ),
                  Text(
                    'Stock Wire',
                    style: TextStyle(
                        fontSize: shapeHeadlineSize,
                        color: ThemeColors().headLineTextColor,
                        fontFamily: ThemeColors().headLineFont,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        CustomContainer().containerHeight,
                    width: MediaQuery.of(context).size.width *
                        CustomContainer().containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(CustomContainer()
                          .containerInnerSideBorderRadius), // Adjust the radius as needed
                      border: Border.all(
                        color: CustomContainer().outsideContainerColor,
                      ),
                      color: ThemeColors().menuContainerColor,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // icon: SizedBox.shrink(),
                      underline: Container(),
                      value: selectedShapeStock,
                      hint: Center(
                        child: Text('Shape',
                            style: TextStyle(
                                fontSize: innerBoxTextSize,
                                fontFamily: ThemeColors().bodyFont,
                                color: ThemeColors().bodyTextColor)),
                      ), // Add a hint here
                      onChanged: (String? newValue) {
                        resetShapeData(false);
                        stockObjectShapeGUI.clearTextField();
                        setState(() {
                          selectedShapeStock = newValue!;
                          if (selectedShapeStock != null) {
                            stockShapeData['shape'] =
                                selectedShapeStock.toString();
                            stockObjectShapeGUI = CreateShapeObject()
                                .createShape(stockShapeData['shape'], 0, 0, 0);
                          }
                        });
                      },
                      items: ShapeOptionsDropDown.shapes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: innerBoxTextSize,
                                    fontFamily: ThemeColors().bodyFont,
                                    color: ThemeColors().bodyTextColor)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: shapeSizeBoxHeight,
                  ),
                  stockObjectShapeGUI.buildWidget(context, false),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        CustomContainer().containerWidth,
                    child: Divider(
                      thickness: CustomContainer().dividerSize,
                      color: CustomContainer().dividerColor,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('customershapedata: $customerShapeData');
                      print('stockshapedata: $stockShapeData');
                      print(resultError);
                      print(showOnlyCustomerLength);
                      // hide the keyboard
                      FocusManager.instance.primaryFocus?.unfocus();
                      // vibration
                      HapticFeedback.vibrate();
                      // Create a shape object for the customer
                      MyShapes customerShapeObject = CreateShapeObject()
                          .createShape(
                              customerShapeData['shape'],
                              customerShapeData['diameter'],
                              customerShapeData['width'],
                              customerShapeData['thickness']);
                      // Create a shape object for the stock
                      MyShapes stockShapeObject = CreateShapeObject()
                          .createShape(
                              stockShapeData['shape'],
                              stockShapeData['diameter'],
                              stockShapeData['width'],
                              stockShapeData['thickness']);
                      // Convert the volume
                      result = Calculator.convertVolume(
                          customerShapeObject,
                          stockShapeObject,
                          customerShapeData['ringSize'],
                          customerShapeData['ringMetalType']);
                      // update the result
                      setState(() {
                        showSteps = result[0];
                        customerShapeLength = result[1];
                        stockShapeLength = result[2];
                        stockShapeWeight = result[3];
                        // if the customer info is empty
                        if (customerShapeLength < 0 ||
                            customerShapeLength.isNaN ||
                            customerShapeLength.isInfinite) {
                          resultError = true;
                          showSteps = "Error";
                          customerShapeLength = 0.0;
                          stockShapeLength = 0.0;
                          stockShapeWeight = 0.0;
                        }
                        //  if the stock info is empty
                        else if (stockShapeLength < 0 ||
                            stockShapeLength.isNaN ||
                            stockShapeLength.isInfinite ||
                            stockShapeWeight < 0 ||
                            stockShapeWeight.isNaN ||
                            stockShapeWeight.isInfinite) {
                          resultError = false;
                          showOnlyCustomerLength = true;
                        }
                        // if eventing is ok
                        else {
                          resultError = false;
                          showOnlyCustomerLength = false;
                        }
                      });
                    },
                    child: Text('Calculate', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          MediaQuery.of(context).size.width *
                              calculateButtonWidth,
                          MediaQuery.of(context).size.height *
                              calculateButtonHeight),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  showSteps == "No steps to show"
                      ? SizedBox()
                      : Container(
                          height: MediaQuery.of(context).size.height *
                              CustomContainer().containerHeightForResult,
                          width: MediaQuery.of(context).size.width *
                              CustomContainer().containerWidthForResult,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(CustomContainer()
                                .containerOutsideBorderRadiusForResult), // Adjust the radius as needed
                            border: Border.all(
                              color: CustomContainer().outsideContainerColor,
                            ),
                            color: ThemeColors().resultContainerColor,
                          ),
                          child: resultError
                              ? Center(
                                  child: Text("Error, please check the inputs",
                                      style: TextStyle(
                                          fontSize: resultBoxTextSize + 3,
                                          color: Colors.red)),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Ring length:",
                                                  style: TextStyle(
                                                      fontSize:
                                                          resultBoxTextSize,
                                                      color: ThemeColors()
                                                          .resultBoxTextColor,
                                                      fontFamily: ThemeColors()
                                                          .resultBoxFont),
                                                ),
                                                Text(
                                                  'Ring weight:',
                                                  style: TextStyle(
                                                      fontSize:
                                                          resultBoxTextSize,
                                                      color: ThemeColors()
                                                          .resultBoxTextColor,
                                                      fontFamily: ThemeColors()
                                                          .resultBoxFont),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                showOnlyCustomerLength
                                                    ? SizedBox()
                                                    : Text(
                                                        'Stock wire:',
                                                        style: TextStyle(
                                                            fontSize:
                                                                resultBoxTextSize,
                                                            color: ThemeColors()
                                                                .resultBoxTextColor,
                                                            fontFamily:
                                                                ThemeColors()
                                                                    .resultBoxFont),
                                                      ),
                                              ]),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${customerShapeLength.toStringAsFixed(1)} [mm]',
                                                  style: TextStyle(
                                                      fontSize:
                                                          resultBoxTextSize,
                                                      color: ThemeColors()
                                                          .resultBoxTextVariables,
                                                      fontFamily: ThemeColors()
                                                          .resultBoxFont),
                                                ),
                                                Text(
                                                  '${stockShapeWeight.toStringAsFixed(1)} [gr]',
                                                  style: TextStyle(
                                                      fontSize:
                                                          resultBoxTextSize,
                                                      color: ThemeColors()
                                                          .resultBoxTextVariables,
                                                      fontFamily: ThemeColors()
                                                          .resultBoxFont),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                showOnlyCustomerLength
                                                    ? SizedBox()
                                                    : Text(
                                                        '${stockShapeLength.toStringAsFixed(1)} [mm]',
                                                        style: TextStyle(
                                                            fontSize:
                                                                resultBoxTextSize,
                                                            color: ThemeColors()
                                                                .resultBoxTextVariables,
                                                            fontFamily:
                                                                ThemeColors()
                                                                    .resultBoxFont),
                                                      ),
                                              ]),
                                        ],
                                      ),
                                      InkWell(
                                        child: Text(
                                          'Show More',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Steps"),
                                                content: SingleChildScrollView(
                                                    child: Column(
                                                  children: [
                                                    Text(showSteps),
                                                    TeXView(
                                                      child: TeXViewColumn(
                                                          children: [
                                                            ShowFormula()
                                                                .stockWireLength(),
                                                            ShowFormula()
                                                                .weightOutput(),
                                                            ShowFormula()
                                                                .lengthFormula(),
                                                          ]),
                                                    )
                                                  ],
                                                )),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Close"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
