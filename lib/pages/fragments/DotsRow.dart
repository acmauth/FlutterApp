import 'package:flutter/material.dart';

// Represents a row of dots with only one shown actived
class DotsRow extends StatelessWidget {
  final int numberOfDots;
  final int imgIndex;

  DotsRow({this.numberOfDots, this.imgIndex});

  // Returns an inactive dot
  Widget _inactiveDot() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 2.0,
          right: 2.0,
        ),
        child: Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.0),
            )),
      ),
    );
  }

  // Returns an active dot
  Widget _activeDot() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 0.0,
                  blurRadius: 2.0,
                )
              ]),
        ),
      ),
    );
  }

  // Builds the row of dots
  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; i++)
      dots.add(i == imgIndex ? _activeDot() : _inactiveDot());

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
