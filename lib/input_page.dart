import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;
  Gender? selectedGender;

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
                  colour: (selectedGender == Gender.male)
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
                ReusableCard(
                  colour: (selectedGender == Gender.female)
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
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
