import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const kResultTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color(0xFF24D876),
  fontSize: 22.0,
);

const kActualBMIStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 100.0,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          ReusableCard(
            flex: 5,
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "OVERWEIGHT",
                  style: kResultTextStyle,
                ),
                Text(
                  "26.7",
                  style: kActualBMIStyle,
                ),
                Text(
                  "You have a higher than normal body weight. Try to exercise more.",
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 5.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}
