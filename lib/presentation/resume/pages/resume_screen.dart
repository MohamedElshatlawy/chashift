import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiftapp/data/models/update_resume_params.dart';
import 'package:shiftapp/domain/date_formatter.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/resources/validation.dart';
import 'package:shiftapp/presentation/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/signup/pages/signup_screen.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/dropdown_filed.dart';
import 'package:shiftapp/presentation/widgets/material_text.dart';
import 'package:shiftapp/presentation/widgets/material_text_field.dart';

class ResumeScreen extends BaseWidget {
  final ResumeComponentData resumeComponentData;
  Function(UpdateResumeParams) onPerformUpdate;
  ResumeScreen(
      {Key? key, required this.resumeComponentData,required this.onPerformUpdate})
      : super(key: key);

  final  birthDateController =TextEditingController();
  late String phoneNumber,
      whatsNumber,
      idNumber,
      bankNumber,
      height,
      weight,
      birthDate;
  int? cityId, qualifID, enLevelId, compLevelId;
  bool isMale = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget buildWidget(BuildContext context) {
    final resume =  resumeComponentData.resume;
    birthDateController .text = resume.birthDateString!=null ?resume.birthDateString! : '';
    birthDate = resume.birthDateString!=null ?resume.birthDateString! : '';
   // bankNumber = resume.idBank.toString();
    height =resume.length.toString();
    weight = resume.wieght.toString();
    whatsNumber = resume.whatsAppNumber.toString();
    phoneNumber = resume.phoneNumber.toString();
    idNumber =resume.idNumber.toString();
    const itemDecoration = kTextFieldDecoration;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MaterialTextField(
                initialValue: resume.idNumber,
                inputDecoration: itemDecoration.copyWith(
                    hintText: strings.id_number,
                    prefixIcon: buildIcon('images/id.png')),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return strings.invalid_id_number;
                  }
                  return null;
                },
                onChanged: (t) {
                  phoneNumber = t;
                },
              ),
              MaterialTextField(
                initialValue: resume.phoneNumber,
                margin: const EdgeInsets.only(top: 16),
                inputDecoration: itemDecoration.copyWith(
                    hintText: strings.phone,
                    prefixIcon: buildIcon('images/smartphone.png')),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty && Validation.isValidPhone(value)) {
                    return strings.invalid_phone;
                  }
                  return null;
                },
                onChanged: (t) {
                  whatsNumber = t;
                },
              ),
              MaterialTextField(
                initialValue: resume.whatsAppNumber,
                margin: const EdgeInsets.only(top: 16),
                inputDecoration: itemDecoration.copyWith(
                    hintText: strings.whats_number,
                    prefixIcon: buildIcon('images/whatsapp.png')),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return strings.invalid_phone;
                  }
                  return null;
                },
                onChanged: (t) {
                  idNumber = t;
                },
              ),
              // MaterialTextField(
              //   initialValue: resume.idBank,
              //   margin: const EdgeInsets.only(top: 16),
              //   inputDecoration: itemDecoration.copyWith(
              //       hintText: strings.bank_iban,
              //       prefixIcon: buildIcon('images/credit_card.png')),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return strings.invalid_bank_id;
              //     }
              //     return null;
              //   },
              //   onChanged: (t) {
              //     bankNumber = t;
              //   },
              // ),
              InkWell(
                onTap: () async {
                  openDatePicker(context);
                },
                child: MaterialTextField(
                  enabled: false,
                  controller: birthDateController,
                  margin: const EdgeInsets.only(top: 16),
                  inputDecoration: itemDecoration.copyWith(
                      hintText: strings.birthdate,
                      prefixIcon: const Icon(
                        Icons.calendar_today,
                        color: kAccent,
                      )),
                  validator: (value) {
                    if (value!.isEmpty ) {
                      return strings.invalid_date;
                    }
                    return null;
                  },
                ),
              ),
/*            Container(height: 48,
              decoration:kBoxDecoration ,
              child: MaterialText('BirthDate'),),*/
              Row(
                children: [
                  Expanded(
                    child: MaterialTextField(
                      initialValue: resume.length!=null ? resume.length.toString():'',
                      margin: const EdgeInsets.only(top: 16),
                      inputDecoration: itemDecoration.copyWith(
                          hintText: strings.height,
                          prefixIcon: buildIcon('images/height.png')),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return strings.invalid_height;
                        }
                        return null;
                      },
                      onChanged: (t) {
                        height = t;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: MaterialTextField(
                      initialValue: resume.wieght!=null ? resume.wieght.toString():'',
                      margin: const EdgeInsets.only(top: 16),
                      inputDecoration: itemDecoration.copyWith(
                          hintText: strings.weight,
                          prefixIcon: buildIcon('images/weight_scale.png')),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return  strings.invalid_weight;
                        }
                        return null;
                      },
                      onChanged: (t) {
                        weight = t;
                      },
                    ),
                  )
                ],
              ),
              DropDownFiledCustom(
                header: strings.select_city,
                initIndex: resume.cityId!=null ? resumeComponentData.cities.firstWhere((element) => element.id==resume.cityId!).id:null,
                margin: const EdgeInsets.only(top: 16),
                items: resumeComponentData.cities
                    .map((e) => e.nameEn.toString())
                    .toList(),
                prefix: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 16),
                  child: Icon(
                    Icons.location_city,
                    color: kAccent,
                  ),
                ),
                onItemSelected: (value) {
                  cityId = resumeComponentData.cities[value.index].id!;
                },
              ),
              DropDownFiledCustom(
                initIndex: resume.qualificationId!=null ? resumeComponentData.qualifications.firstWhere((element) => element.id==resume.qualificationId!).id:null,
                header: strings.select_qualification ,
                margin: const EdgeInsets.only(top: 16),
                items: resumeComponentData.qualifications
                    .map((e) => e.qualificationName.toString())
                    .toList(),
                prefix: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: buildIcon('images/diploma.png'),
                ),
                onItemSelected: (value) {
                  qualifID =
                      resumeComponentData.qualifications[value.index].id!;
                },
              ),
              DropDownFiledCustom(
                initIndex: resume.englishLevel!=null ? resumeComponentData.levels.firstWhere((element) => element.id==resume.englishLevel!).id:null,
                header: strings.select_english_level,
                margin: const EdgeInsets.only(top: 16),
                items: resumeComponentData.levels
                    .map((e) => e.levelName.toString())
                    .toList(),
                prefix: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: buildIcon('images/controls.png'),
                ),
                onItemSelected: (value) {
                  enLevelId = resumeComponentData.levels[value.index].id!;
                },
              ),
              DropDownFiledCustom(
                initIndex: resume.computerLevel!=null ?resumeComponentData.levels.firstWhere((element) => element.id==resume.computerLevel!).id:null,
                header: strings.select_computer_level,
                margin: const EdgeInsets.only(top: 16),
                items: resumeComponentData.levels
                    .map((e) => e.levelName.toString())
                    .toList(),
                prefix: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: buildIcon('images/controls.png'),
                ),
                onItemSelected: (value) {
                  compLevelId = resumeComponentData.levels[value.index].id!;
                },
              ),
              SelectGender(
                  initValue: resume.gender==true ? Gender.Male:Gender.Female,
                  onSelect: (value) {
                isMale = value == Gender.Male;
              }),
              AppButton(
                text: strings.save_button,
                onPressed: () {
                  if(_formKey.currentState!.validate()&& cityId !=null &&qualifID!=null && enLevelId!=null && compLevelId!=null ){
                    onPerformUpdate(UpdateResumeParams(cityId: cityId, birthDateString: birthDate , computerLevel: compLevelId,englishLevel: enLevelId,
                    idNumber: idNumber,length: int.parse(height),weight: int.parse(weight),phoneNumber: phoneNumber,qualificationId: qualifID,whatsAppNumber: whatsNumber));
                  }else{
                    if(cityId ==null ||qualifID==null || enLevelId==null || compLevelId==null ){
                      DialogsManager.showMessageDialog(context, strings.invalid_profile_selections, onClickOk: (){});
                    }
                  }
                },
                raduis: BorderRadius.circular(12),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon(String path) {
    return Image.asset(
      path,
      color: kAccent,
      scale: 3,
    );
  }

  Future<void> openDatePicker(BuildContext context) async {

    DateTime? newSelectedDate = await showDatePicker(context: context,
        initialDate: DateTime(DateTime.now().year-17), firstDate: DateTime(1940,1,1), lastDate: DateTime(DateTime.now().year-17),
        locale:  context.getLocal());
    if(newSelectedDate!=null) {
      birthDate = DateFormatter.formatDate(newSelectedDate, DateFormatter.DAY_MONTH_YEAR);
      birthDateController.text = birthDate;}
  }
}
