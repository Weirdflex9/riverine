import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';

/// 自定义Bottombar
class MyBottomBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final int currentIndex;
  final Color textFocusColor;
  final Color textUnfocusColor;
  final Color background;
  final double textFontSize;
  final ValueChanged<int>? onTap;
  final double iconSize;

  const MyBottomBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.textFocusColor = Colors.red,
    this.textUnfocusColor = Colors.grey,
    this.background = Colors.white,
    this.textFontSize = 10.0,
    this.onTap,
    this.iconSize = 40.0,
  }) : super(key: key);

  @override
  _MyBottomBarState createState() {
    return _MyBottomBarState();
  }
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(22, 10, 8, 0.04),
            offset: Offset(0, -4.w),
            blurRadius: 16.w,
            spreadRadius: 0,
          ),
        ],
        color: widget.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.w),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 100.w,
          child: Row(
            children: List.generate(
              widget.items.length,
              (index) => _createItem(
                index,
                width / widget.items.length,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createItem(int i, double itemWidth) {
    BottomBarItem item = widget.items[i];
    bool selected = (i == widget.currentIndex);
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(i);
        }
      },
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Offstage(
                  offstage: selected,
                  child: LoadAssetImage(
                    item.icon,
                    width: widget.iconSize,
                    height: widget.iconSize,
                  ),
                ),
                Offstage(
                  offstage: !selected,
                  child: LoadAssetImage(
                    item.activeIcon,
                    width: widget.iconSize,
                    height: widget.iconSize,
                  ),
                ),
              ],
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: widget.textFontSize,
                color: selected ? widget.textFocusColor : widget.textUnfocusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem {
  final String icon; //未选中状态图标
  final String activeIcon; //选中状态图标
  final String title; //文字

  BottomBarItem(this.icon, this.activeIcon, this.title);
}
