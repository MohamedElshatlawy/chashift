import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';

// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends StatelessWidget {
  final String? error;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage ;
  final double? height;
   ErrorPlaceHolderWidget({Key? key,
     this.error,
    this.exception,
    this.onClickReload,
     this.showImage = true,
    this.color,
    this.height,
  }) : super(key: key);
  Widget ? placeHolderImage ;
   String ?  message ;
   getErrorMessage(BuildContext context) {

    if (exception is DioError) {
      if ((exception as DioError ).error is SocketException) {
        //placeHolderImage = Image.asset(Res.connection_error);
        message =  'context.getStrings().error_internet_connection';
      }
     else if ((exception as DioError ).error is WebSocketException || exception is HandshakeException) {
       // placeHolderImage = Image.asset(Res.connection_error);
        message ='context.getStrings().error_internet_connection';
      }else
      message =  (exception as DioError ).message;
    }


    if (exception is SocketException) {
     // placeHolderImage = Image.asset(Res.connection_error);
     message ='context.getStrings().error_internet_connection';
    }
    if (exception is WebSocketException || exception is HandshakeException) {
     // placeHolderImage = Image.asset(Res.connection_error);
     message ='context.getStrings().check_network_connection';
    }
    if(error !=null ) message =error!;
    if(message==null) 'خطأ غير معروف';
  }

  @override
  Widget build(BuildContext context) {
     getErrorMessage(context);
    return Container(
        color: color ?? Colors.white,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              placeHolderImage!=null && showImage?
              Container(
                height: 150,
                padding: const EdgeInsets.only(bottom: 18),
                color: color ?? Colors.white,
                child: placeHolderImage,
              ):Container(),
              SizedBox(
                child: Text(
                  message.toString(),
                  style:
                      kTextBold.copyWith(color: kPrimaryDark, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 18,),
               onClickReload != null
                  ? TextButton(
                      onPressed: onClickReload,
                      child: Text(
                        'context.getStrings().click_to_reload',
                        style: kTextRegular.copyWith(
                          color: Colors.white,
                          fontSize: 12,),
                      ),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
