import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';

Widget kBuildImage(String path, {double? size}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: FadeInImage.assetNetwork(
      fit: BoxFit.fitWidth,
      placeholder: 'images/loading.gif',
      image: path,
      height: size ?? 40,
      imageErrorBuilder: (c, o, s) {
        print('imageErrorBuilder error  }');
        return SizedBox(
          height: size ?? 40,
          child: Image.asset('images/ic_worker.png'),
        );
      },
    ),
  );
}

Widget kBuildCircleImage(String path, {double? size}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: kGrey_D6.withOpacity(0.5),
        width: 1.0,
      ),
    ),
    child: ClipOval(
      child: FadeInImage.assetNetwork(
        fit: BoxFit.fitWidth,
        placeholder: 'images/user.png',
        image: path,
        height: size ?? 40,
        width: size!=null ? (size-8) :  40,
        imageErrorBuilder: (c, o, s) {
          print('imageErrorBuilder error  }');
          return Container(
            color: kWhiteF2,
            padding: const EdgeInsets.all(2),
            width: size!=null ? (size-8) :  40,
            height: size ?? 40,
            child: Image.asset('images/user.png',scale: 1,),
          );
        },
      ),
    ),
  );
}
