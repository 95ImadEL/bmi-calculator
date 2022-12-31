import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onTap;
  const ReusableCard({required this.colour, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(10.0)),
          child: cardChild,
        ),
      ),
    );
  }
}
