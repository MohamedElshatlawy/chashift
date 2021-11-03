import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';

class MaterialTextField extends StatelessWidget {

  final TextEditingController? controller ;
  final EdgeInsetsGeometry? margin ;
   final AutovalidateMode? autovalidateMode ;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode ;
  final double radius ;
  final bool ? enabled ;
  final Color? color;
  final Widget ?startIcon ;
  final String? initialValue;
  final InputDecoration ?inputDecoration ;
  final TextInputAction? textInputAction ;
  final TextInputType ?keyboardType ;
  final ValueChanged<String>? onChanged;
  const MaterialTextField({Key? key, this.controller, this.margin, this.autovalidateMode= AutovalidateMode.onUserInteraction, this.validator,
    this.focusNode, this.inputDecoration, this.keyboardType, this.onChanged, this.radius = 8, this.initialValue, this.enabled,
    this.color, this.textInputAction = TextInputAction.next,this.startIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: margin!=null?margin!:EdgeInsets.zero,
      child: Row(
        children: [
          startIcon!=null ? startIcon! : Container(),
          Expanded(
            child: TextFormField(
              textInputAction: textInputAction,
              initialValue:initialValue ,
              controller:controller ,
              autovalidateMode:autovalidateMode ,
              validator:validator,
              focusNode: focusNode,
              onChanged:onChanged,
              enabled: enabled,
              keyboardType: keyboardType,
              decoration: inputDecoration!=null ? inputDecoration! :kTextFieldDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
