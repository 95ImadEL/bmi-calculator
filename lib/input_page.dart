import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

enum Gender { male, female }

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  Gender? selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  colour: (selectedGender == Gender.male)
                      ? kActiveCardColor
                      : kInactiveCardColor,
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
                      ? kActiveCardColor
                      : kInactiveCardColor,
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
          ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    }),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  colour: kActiveCardColor,
                ),
                ReusableCard(
                  colour: kActiveCardColor,
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
