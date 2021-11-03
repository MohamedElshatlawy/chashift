import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
class DropDownFiledCustom extends StatefulWidget {
  final Function(Item) onItemSelected;
  final Function(int)? onIndexSelected;
  final Widget Function(BuildContext context, int index)? itemBuilder;
  final String? header;
  final int? initIndex;
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final Widget ? prefix ;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final List<String> items;
  final List<int>? disableItems;
  final bool isVisible;
  final TextStyle? labelStyle;

   DropDownFiledCustom(
      {this.label,
      this.hintText,
      this.errorText,
      this.enabled,
      this.margin,
      this.decoration,
      required this.items,
      required this.onItemSelected,
      this.labelStyle,
      this.isVisible = true,
      this.onIndexSelected,
      this.header,
      this.disableItems,
        this.prefix ,
      this.initIndex,
      this.itemBuilder})
      : super();
  @override
  State<StatefulWidget> createState() {
    return _DropdownFiled();
  }
}

class Item {
   int index;
  final String value;

  Item({required this.index, required this.value});
}

class _DropdownFiled extends State<DropDownFiledCustom> {
  Item? selectedValue;
  bool headerAdded = false;
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry margin =
        widget.margin != null ? widget.margin! : EdgeInsets.zero;
    final labelStyle = widget.labelStyle ?? kTextSemiBold.copyWith(fontSize: 12, color: kFontDark);
    List<Item> listItems = [];
    for (int i = 0; i < widget.items.length; i++) {
      int index = widget.header != null ? i + 1 : i;
      listItems.add(Item(index: index, value: widget.items[i]));
    }
    return widget.isVisible
        ? Padding(
            padding: margin,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  widget.label != null
                      ? Text(
                          widget.label!,
                          textAlign: TextAlign.start,
                          style: labelStyle,
                        )
                      : Container(),
                  SizedBox(
                    height: widget.label != null ? 10 : 0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: widget.decoration ?? BoxDecoration(
                            color: kWhiteOff,
                            border: Border.all(
                                color: kPaleGray,
                                width: 0,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                       widget.prefix !=null? widget.prefix! : Container()  ,
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: getAndroidPicker(listItems),
                        )),
                      ],
                    ),
                  ),
                ]))
        : Container();
  }

  Widget getAndroidPicker(List<Item> listItems) {
    print('Start with SELECTED ${selectedValue} => ${selectedValue}');

    if (widget.header != null)
      listItems.insert(0, Item(index: 0, value: widget.header!));
    return DropdownButton<Item>(
        isExpanded: true,
        autofocus: false,
        elevation: 16,
        underline: Container(),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black45,
        ),
        value: selectedValue != null
            ? listItems
                .firstWhere((element) => element.index == selectedValue!.index)
            : listItems[0],
        onChanged: (value) {

            if (value!.index == 0 && widget.header != null) {
              print('selectedValue transpo ${widget.disableItems!.contains(value.index)}');
            }else {
              setState(() {
                selectedValue = value;
              });
              Item realValue  = Item(value: value.value,index: value.index);
              if(widget.header != null){
                realValue.index = realValue.index-1 ;
              }
              widget.onItemSelected(realValue);
            }

        },
        dropdownColor: Colors.white,
        items: getDropdownMenuItem(listItems));
  }

  List<DropdownMenuItem<Item>> getDropdownMenuItem(List<Item> list) {
    var dropdownMenuItemList = list.map<DropdownMenuItem<Item>>((Item value) {
      bool disabled = (widget.disableItems != null &&
          widget.disableItems!.contains(value.index));
      return DropdownMenuItem<Item>(
        value: value,
        child: value.index == 0 && widget.header != null
            ? Container(
                width: double.infinity,
                child: Text(
                  value.value.toString(),
                  style: kTextLabel.copyWith(color: kGrey_C3, fontSize: 14),
                  textAlign: TextAlign.start,
                ),
              )
            : widget.itemBuilder != null
                ? widget.itemBuilder!(context, value.index)
                : Container(
                    width: double.infinity,
                    child: Text(
                      value.value.toString(),
                      style:
                          kTextLabel.copyWith(fontSize: 14, color: disabled ? kGrey_C3:kFontDark),
                      textAlign: TextAlign.start,
                    ),
                  ),
      );
    });
    return dropdownMenuItemList.toList();
  }
}
