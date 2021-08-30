import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/constants/colors.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;
  final bool active;

  const ActionButton(
    this.title,
    this.iconPath,
    this.onTap, {
    this.active = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          SvgPicture.asset(
            iconPath,
            color: active ? primaryColor : Colors.black87,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: active ? primaryColor : Colors.black87,
                    fontSize: 16.0),
              ),
              if (active)
                Positioned(
                  top: -3.0,
                  right: -12.0,
                  child: Container(
                    width: 14.0,
                    height: 14.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tick.svg',
                      height: 5.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
