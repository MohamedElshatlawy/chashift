import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';

abstract class BaseWidget extends StatelessWidget{
  final strings = Get.context!.getStrings();
  final  CustomProgressDialog progress = DialogsManager.createProgress(Get.context!)  ;

   BaseWidget({Key? key}) : super(key: key);
  @protected
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) =>buildWidget(context);

}
