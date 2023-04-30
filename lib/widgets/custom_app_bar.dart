import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/card.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallBack;
  CustomAppBar(this.leftIcon, this.rightIcon, this.leftCallBack, {required Card Function(BuildContext context, int index) itemBuilder});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 10, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftCallBack != null ? () => leftCallBack!() : null,
              child: _buildIcon(leftIcon),
            ),
            _buildIcon(rightIcon),
          ],
        ));
  }

  Container _buildIcon(IconData icon) {
    return Container(
              padding: EdgeInsets.all(0),
              child: Icon(
                icon,
                size: 25,
              ),
            );
  }
}
