// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter_tex/flutter_tex.dart';

class ShowFormula {
  // variable info
  String variableNamedAndInfo() {
    String formulaInformation = """
L1 = length of wire 1 from array
V1 = volume of wire 1
A2 = cross section of wire 2
L2 = length to output of wire 2
W = total weight
A2 = area of wire 2
L2 = length of wire 2
P = density: according to array metal type VS density
""";

    return formulaInformation;
  }

  TeXViewDocument stockWireLength() {
    return TeXViewDocument(r"""$$L_2 = \frac{V_1}{A_2}$$""");
  }

  TeXViewDocument weightOutput() {
    return TeXViewDocument(r"""$$W = A \cdot L \cdot P$$""");
  }

  TeXViewDocument lengthFormula() {
    return TeXViewDocument(r"""$$L_1 = \pi \cdot (ID + t)$$""");
  }
}
