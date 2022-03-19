import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color color;
  final List<Widget> actions;
  final Color iconColor;
  final Color iconThemeColor;
  final Widget? leading;
  final String title;
  final PreferredSizeWidget? bottom;

  static const defaultAppbarColor = Color.fromRGBO(164, 212, 180, 1);

  const CustomAppBar({
    Key? key,
    this.color = defaultAppbarColor,
    this.actions = const [],
    this.leading,
    this.iconColor = Colors.white,
    this.iconThemeColor = Colors.white,
    this.bottom,
    required this.title,
  })  : preferredSize = bottom == null
            ? const Size.fromHeight(kToolbarHeight)
            : const Size.fromHeight(kToolbarHeight + 10),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      leading: widget.leading,
      backgroundColor: widget.color,
      actions: widget.actions,
      centerTitle: true,
      iconTheme: IconThemeData(color: widget.iconThemeColor),
      title: Text(
        widget.title,
        style: CustomTextStyles.textMediumBold,
      ),
      bottom: widget.bottom,
    );
  }
}
