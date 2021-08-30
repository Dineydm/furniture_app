import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'vertical_separator.dart';
import '/data/fake.dart';
import '/widgets/cart.dart';

import 'action_button.dart';
import 'filter_modal_bottom_sheet.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.0,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Text(
                  'Living Room',
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  width: 60.0,
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 18.0,
                      ),
                      Cart(numberOfItemsInCart: Fake.numberOfItemsInCart)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                  'Filter',
                  'assets/icons/controls.svg',
                  () {
                    _settingModalBottomSheet(context);
                  },
                  active: true,
                ),
                VerticalSeparator(),
                ActionButton(
                  'Sort',
                  'assets/icons/sort.svg',
                  () {},
                ),
                VerticalSeparator(),
                ActionButton(
                  'List',
                  'assets/icons/list.svg',
                  () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return FilterModalBottomSheet();
        });
  }
}
