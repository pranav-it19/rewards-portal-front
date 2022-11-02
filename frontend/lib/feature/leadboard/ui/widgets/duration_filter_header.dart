import 'package:flutter/material.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';

class DurationFilterHeader extends StatelessWidget {
  const DurationFilterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorConstants.blueHighlight,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'All Time',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: ColorConstants.blueHighlight,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'This Week',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: ColorConstants.blueHighlight,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'This Month',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
