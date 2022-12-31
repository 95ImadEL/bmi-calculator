import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  //1=male, 2=female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColor) {
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
        femaleCardColour = activeCardColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactiveCardColor) {
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
        maleCardColour = activeCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  colour: maleCardColour,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
                  onTap: () {
                    setState(() {
                      updateColour(1);
                    });
                  },
                ),
                ReusableCard(
                  onTap: () {
                    setState(() {
                      updateColour(2);
                    });
                  },
                  colour: femaleCardColour,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: "FEMALE"),
                ),
              ],
            ),
          ),
          const ReusableCard(
            colour: activeCardColor,
          ),
          Expanded(
            child: Row(
              children: const [
                ReusableCard(
                  colour: activeCardColor,
                ),
                ReusableCard(
                  colour: activeCardColor,
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
