import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/joboffers/bloc/job_offers_bloc.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text.dart';

class ListJobsScreen extends StatelessWidget {
  final List<JobOffer> offers;

  const ListJobsScreen({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: offers.length,
        itemBuilder: (con, pos) {
          final jobOffer = offers[pos];

          return JobItem(jobOffer);
        });
  }
}

class JobItem extends BaseWidget {
  final JobOffer jobOffer;
  final EdgeInsetsGeometry padding;
  final Function? onApplyOffer;
  final double? elevation;
  JobItem(this.jobOffer,
      {Key? key,
      this.elevation,
      this.onApplyOffer,
      this.padding = const EdgeInsets.only(left: 16, right: 16, top: 16)})
      : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final bloc = getKoin().get<JobOffersBloc>();
    final progress = DialogsManager.createProgress(context);
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is LoadingDialogState) {
          progress.show();
        }

        if (state is Initialized) {
          progress.dismiss();
          if (onApplyOffer != null) onApplyOffer!();

          DialogsManager.showMessageDialog(context, state.data,
              onClickOk: () {});
        }

        if (state is ErrorDialogState) {
          progress.dismiss();
          DialogsManager.handleErrorDialogBuilder(context, state.error);
        }
      },
      child: Container(
        padding: padding,
        child: Card(
          elevation: elevation ?? 4,
          shadowColor: kGrey_D6,
          color: Colors.grey.shade50,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  color: kApricot,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: kAccent,
                    ),
                    Text(
                      '${jobOffer.workingDate} ${jobOffer.opportunitiesStrartTime}',
                      style: kTextBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop_outlined,
                          color: kAccent,
                        ),
                        Expanded(
                          child: Text(
                            jobOffer.projectAddress.toString().trim(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: kTextSemiBold.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.work_outline,
                          color: kAccent,
                        ),
                        Text(
                          '\t' + jobOffer.jobName.toString(),
                          style: kTextSemiBold.copyWith(fontSize: 14),
                        ),
                        Text(
                          '\t Per ' +
                              jobOffer.salary.toString().addCurrency(context),
                          style: kTextSemiBold.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Wrap(
                      spacing: 2.0, // gap between adjacent chips
                      runSpacing: 0.0, //// gap between lines
                      children: <Widget>[
                        Chip(
                          label: Text(
                              '${strings.age}  ${jobOffer.jobRequirements!.ageFrom.toString()} ${strings.to} ${jobOffer.jobRequirements!.ageTo.toString()}'),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          backgroundColor: Colors.grey.shade200,
                          label: MaterialText(
                            '${jobOffer.jobRequirements!.lengthFrom.toString()} ${strings.to} ${jobOffer.jobRequirements!.lengthTo.toString()}',
                            startIcon: Image.asset(
                              'images/height.png',
                              scale: 3,
                              color: kAccent,
                            ),
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.grey.shade200,
                          label: MaterialText(
                            '${jobOffer.jobRequirements!.wieghtFrom.toString()} ${strings.to} ${jobOffer.jobRequirements!.wieghtTo.toString()}',
                            startIcon: Image.asset(
                              'images/weight_scale.png',
                              scale: 3,
                              color: kAccent,
                            ),
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.grey.shade200,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: kAccent,
                              ),
                              Text('\t' +
                                  jobOffer.jobRequirements!.hoursCount
                                      .toString() +
                                  strings.hours),
                            ],
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.grey.shade200,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.person,
                                color: kAccent,
                              ),
                              Text('\t' +
                                  jobOffer.jobRequirements!.gender.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  width: 120,
                  child: AppButton(
                    margin: const EdgeInsetsDirectional.only(end: 8),
                    backgroundColor: kApricot,
                    onPressed: () {
                      bloc.add(ApplyOpportunitiesEvent(jobOffer.id!));
                    },
                    text: strings.join,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
