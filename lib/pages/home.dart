// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:or_calculator/Services/DropDownDataBase.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/Services/Shapes/defaultShape.dart';
import 'package:or_calculator/Services/calculator.dart';
import 'package:or_calculator/pages/custom_container.dart';
import 'package:or_calculator/pages/homeShapes.dart';
import 'package:or_calculator/theme.dart';

// Home Page variables for shapes
const double allSizePadding = 15.0;
const double sizeBoxHeight = 10;
const double sizeBoxWidth = 2;
// Page Text
const double innerBoxTextSize = 14;
const double shapesAttributesTextSize = 11;
const double resultBoxTextSize = 14;
// headline size and color
const double shapeHeadlineSize = 14;
const Color shapeHeadlineColor = Color.fromARGB(255, 73, 5, 233);

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
  // DropDown Menus
  String? selectedMetalType;
  String? selectedShapeCustomer;
  String? selectedShapeStock;
  double? selectedSize;

// default shape object
  MyShapes customerObjectShapeGUI = DefaultShape();
  MyShapes stockObjectShapeGUI = DefaultShape();

  void resetShapeData(bool customerData) {
    customerShapeLength = 0.0;
    stockShapeLength = 0.0;
    stockShapeWeight = 0.0;
    showSteps = "No steps to show";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odeni Jewelry'),
        backgroundColor: ThemeColors().appBarColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(allSizePadding),
            child: Column(
              children: [
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
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // icon: SizedBox.shrink(),
                      underline: Container(),
                      value: selectedMetalType,
                      hint: Center(
                          child: Text(
                        'Metal Type',
                        style: TextStyle(fontSize: innerBoxTextSize),
                      )), // Add a hint here
                      onChanged: (String? newValue) {
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
                              style: TextStyle(fontSize: innerBoxTextSize),
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
                    ),
                    child: DropdownButton<double>(
                      isExpanded: true,
                      // icon: SizedBox.shrink(),
                      underline: Container(),
                      value: selectedSize, // currently selected value
                      hint: Center(
                          child: Text(
                        'Size US',
                        style: TextStyle(fontSize: innerBoxTextSize),
                      )), // Add a hint here

                      items: SizeOptionsDropDown.sizes.map((size) {
                        return DropdownMenuItem<double>(
                          value: size, // value associated with the menu item
                          child: Center(
                            child: Text(
                              "${size.toString()}  US",
                              style: TextStyle(fontSize: innerBoxTextSize),
                            ),
                          ), // displayed text
                        );
                      }).toList(),
                      onChanged: (newValue) {
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
                  width: MediaQuery.of(context).size.width *
                      CustomContainer().containerWidth,
                  child: Divider(
                    thickness: CustomContainer().dividerSize,
                    color: CustomContainer().dividerColor,
                  ),
                ),
                Text(
                  'Customer Shape',
                  style: TextStyle(
                      fontSize: shapeHeadlineSize,
                      color: shapeHeadlineColor,
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
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    // icon: SizedBox.shrink(),
                    underline: Container(),
                    value: selectedShapeCustomer,
                    hint: Center(
                        child: Text(
                      'Shape',
                      style: TextStyle(fontSize: innerBoxTextSize),
                    )), // Add a hint here
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedShapeCustomer = newValue!;
                        // reset the shape data
                        resetShapeData(true);
                        if (selectedShapeCustomer != null) {
                          customerShapeData["shape"] =
                              selectedShapeCustomer.toString();
                          customerObjectShapeGUI = CreateShapeObject()
                              .createShape(customerShapeData["shape"], 0, 0, 0);
                        }
                      });
                    },
                    items: ShapeOptionsDropDown.shapes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(value,
                              style: TextStyle(fontSize: innerBoxTextSize)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                customerObjectShapeGUI.buildWidget(context, true),
                Center(
                  child: Icon(
                    Icons.arrow_downward,
                    size: MediaQuery.of(context).size.width *
                        0.15, // Adjust the size as needed
                    color: Colors.blue, // Change the color if desired
                  ),
                ),
                Text(
                  'Stock Shape',
                  style: TextStyle(
                      fontSize: shapeHeadlineSize,
                      color: shapeHeadlineColor,
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
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    // icon: SizedBox.shrink(),
                    underline: Container(),
                    value: selectedShapeStock,
                    hint: Center(
                      child: Text(
                        'Shape',
                        style: TextStyle(fontSize: innerBoxTextSize),
                      ),
                    ), // Add a hint here
                    onChanged: (String? newValue) {
                      resetShapeData(false);
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
                              style: TextStyle(fontSize: innerBoxTextSize)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                stockObjectShapeGUI.buildWidget(context, false),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      CustomContainer().containerWidth,
                  child: Divider(
                    thickness: CustomContainer().dividerSize,
                    color: CustomContainer().dividerColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('customershapedata: $customerShapeData');
                    print('stockshapedata: $stockShapeData');
                    print(resultError);
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
                    MyShapes stockShapeObject = CreateShapeObject().createShape(
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

                      if (customerShapeLength < 0 ||
                          stockShapeLength < 0 ||
                          stockShapeWeight < 0 ||
                          customerShapeLength.isNaN ||
                          stockShapeLength.isNaN ||
                          stockShapeWeight.isNaN ||
                          customerShapeLength.isInfinite ||
                          stockShapeLength.isInfinite ||
                          stockShapeWeight.isInfinite) {
                        resultError = true;
                        showSteps = "No steps to show";
                        customerShapeLength = 0.0;
                        stockShapeLength = 0.0;
                        stockShapeWeight = 0.0;
                      } else {
                        resultError = false;
                      }
                    });
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      CustomContainer().containerWidth,
                ),
                Container(
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
                  ),
                  child: resultError
                      ? Center(
                          child: Text("Error, please check the inputs",
                              style: TextStyle(
                                  fontSize: resultBoxTextSize + 3,
                                  color: Colors.red)),
                        )
                      : Column(
                          children: [
                            Text(
                              "Customer Length: ${customerShapeLength.toStringAsFixed(1)} mm",
                              style: TextStyle(fontSize: resultBoxTextSize),
                            ),
                            Text(
                              "Stock Length: ${stockShapeLength.toStringAsFixed(1)} mm",
                              style: TextStyle(fontSize: resultBoxTextSize),
                            ),
                            Text(
                              "Weight: ${stockShapeWeight.toStringAsFixed(1)} g",
                              style: TextStyle(fontSize: resultBoxTextSize),
                            ),
                            InkWell(
                              child: Text(
                                'Show Steps',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Steps"),
                                      content: SingleChildScrollView(
                                          child: Text(showSteps)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
