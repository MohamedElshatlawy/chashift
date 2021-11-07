import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'إكتب رسالتك هنا ...',
  hintStyle: TextStyle(
    color: kSteal,
    fontSize: 14.0,
    fontFamily: 'Bahij_Regular',
  ),
  border: InputBorder.none,
);

const kTextFieldNoBordersDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintStyle: TextStyle(
    color: kGrey_C3,
    fontSize: 16.0,
    fontFamily: 'CairoRegular',
  ),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kButtonTextStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.white,
  fontFamily: 'CairoRegular',
);

const kTextLabel = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontFamily: 'CairoRegular',
);
const kTextLabelWhite = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontFamily: 'CairoRegular',
);
const kTextLabelNormal = TextStyle(
  color: kFontDarkGreen,
  fontSize: 14.0,
  fontFamily: 'CairoRegular',
);
const kTextLabelSmall = TextStyle(
  color: Colors.black,
  fontSize: 10.0,
  fontFamily: 'CairoRegular',
);

const kTextLabelFontDark = TextStyle(
  color: kFontDarkGreen,
  fontSize: 16.0,
  fontFamily: 'CairoRegular',
);

const kTextSemiBold = TextStyle(
  color: kFontDarkGreen,
  fontSize: 16.0,
  fontFamily: 'CairoSemiBold',
);
const kDrawerItemStyle =
    TextStyle(fontFamily: 'CairoRegular', fontSize: 15, color: kPrimary);
const kTextRegular = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontFamily: 'CairoRegular',
);
const kTextBold = TextStyle(
  color: kFontDark,
  fontSize: 16.0,
  fontFamily: 'CairoBold',
);

const kTextBoldTitle = TextStyle(
  color: kFontDarkGreen,
  fontSize: 18.0,
  fontFamily: 'CairoBold',
);
const kTextBoldSmall = TextStyle(
  color: kFontDarkGreen,
  fontSize: 11.0,
  fontFamily: 'CairoBold',
);

const kTextBodyBold = TextStyle(
  color: kFontDarkGreen,
  fontSize: 14.0,
  fontFamily: 'CairoBold',
);

const kTextExtraBold = TextStyle(
  color: kFontDarkGreen,
  fontSize: 18.0,
  fontFamily: 'CairoBlack',
);

const kProfileFieldDecoration = InputDecoration(
    fillColor: kPaleGrey2,
    filled: true,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ));
const kTextFieldProfileItemDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(
      color: kSteal,
      fontSize: 13.0,
      fontFamily: 'Bahij_Regular',
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ));

const kTextDescriptionFieldDecoration = InputDecoration(
    filled: true,
    fillColor: kFillColor,
    hintStyle: TextStyle(
      color: kSteal,
      fontSize: 13.0,
      fontFamily: 'Bahij_Regular',
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: kPaleGray, width: 1.1, style: BorderStyle.solid),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: kPaleGray, width: 1.1, style: BorderStyle.solid),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: kPaleGray, width: 1.1, style: BorderStyle.solid),
    ));

const kTextFieldCommentDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontFamily: 'Bahij_Regular',
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide:
          BorderSide(color: kBordColor, width: 1.1, style: BorderStyle.solid),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide:
          BorderSide(color: kWhiteOff, width: 1, style: BorderStyle.solid),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: kSteal, width: 1, style: BorderStyle.solid),
    ));

const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: kWhiteOff,
    hintStyle: TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontFamily: 'Bahij_Regular',
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    border: OutlineInputBorder(

      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,

    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide:
          BorderSide(color: kBordColor, width: 1.1, style: BorderStyle.solid),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide:
          BorderSide(color: kPrimary, width: 1.1, style: BorderStyle.solid),
    ));


final kBoxDecoration = BoxDecoration(
    color: kWhiteOff,
    border: Border.all(
        color: kPaleGray,
        width: 0,
        style: BorderStyle.none),
    borderRadius: BorderRadius.circular(12));
final kFieldDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(2, 2), // c
    )
  ],
  borderRadius: BorderRadius.circular(4),
);

const kRequestTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderSide:
          BorderSide(color: kBordColor, width: 1, style: BorderStyle.solid),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: kBordColor, width: 1, style: BorderStyle.solid),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: kPrimary, width: 1, style: BorderStyle.solid),
    ));

const kInputDecoration = InputDecoration(
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: kFontGreenHint,
    fontSize: 18.0,
    fontFamily: 'CairoRegular',
  ),
  fillColor: Colors.white,
);

const kInputDecorationDisables = InputDecoration(
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: kFontGreenHint,
    fontSize: 18.0,
    fontFamily: 'CairoRegular',
  ),
  fillColor: kWhiteF2,
);

const kCountryCodeList = [
  '+974',
  '+966',
  '+212',
  '+971',
  '+973',
  '+968',
  '+965',
  '+962'
];

kHideKeyboard(){
  SystemChannels.textInput.invokeMethod('TextInput.hide');

}