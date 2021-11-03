import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? startIcon;
  final double? height;
  final double? elevation;
  final EdgeInsetsGeometry? startIconPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? raduis;

  const AppButton(
      {this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textStyle,
      this.startIcon,
      this.padding,
      this.margin,
      this.raduis,
      this.height,
      this.startIconPadding,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    var space = startIcon != null ? 20.0 : 15.0;

    Color enabledColor = backgroundColor != null
        ? backgroundColor!
        : kPrimaryDark;

    Color color = onPressed != null ? enabledColor : Colors.grey;
    return Padding(
      padding: margin != null ? margin! : EdgeInsets.all(0),
      child: MaterialButton(
        height: height,
        padding: padding != null ? padding : EdgeInsets.all(8),
        elevation: elevation != null ? elevation : 5.0,
        shape: RoundedRectangleBorder(
            borderRadius:
                raduis != null ? raduis! : BorderRadius.circular(8.0)),
        onPressed: onPressed,
        color: color,
        child: startIcon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: startIconPadding != null
                        ? startIconPadding!
                        : EdgeInsets.all(0.0),
                    child: startIcon,
                  ),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: textStyle ?? kButtonTextStyle,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textStyle ?? kButtonTextStyle,
                  ),
                ],
              ),
      ),
    );
  }
}
