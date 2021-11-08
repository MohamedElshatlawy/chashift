import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiftapp/domain/user.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/login/pages/login_page.dart';
import 'package:shiftapp/presentation/profile/bloc/profile_bloc.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/widgets/decorations.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/error_handler_widget.dart';
import 'package:shiftapp/presentation/widgets/image_builder.dart';
import 'package:shiftapp/presentation/widgets/loading_widget.dart';
import 'package:shiftapp/presentation/widgets/material_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required ProfileBloc profileBloc})
      : _profileBloc = profileBloc;

  final ProfileBloc _profileBloc;

  @override
  ProfileScreenState createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = DialogsManager.createProgress(context);
    _load();
    return Scaffold(
      body: BlocBuilder<ProfileBloc, CommonState>(
          bloc: widget._profileBloc,
          buildWhen: (c, state) {
            return state is Initialized<User> ||
                state is LoadingState ||
                state is ErrorState;
          },
          builder: (
            BuildContext context,
            CommonState currentState,
          ) {
            print('LOADING STATE ${currentState}');
            if (currentState is LoadingState) {
              return LoadingView();
            }
            if (currentState is ErrorState) {
              return ErrorPlaceHolderWidget(
                exception: currentState.error,
              );
            }
            if (currentState is Initialized<User>) {
              return BlocListener<ProfileBloc, CommonState>(
                bloc: widget._profileBloc,
                listener: (context, state) {
                  if (state is LoadingDialogState) {
                    progress.show();
                  }
                  if (state is FinishedDialogState) {
                    progress.dismiss();
                  }
                  if (state is ErrorDialogState) {
                    print('ON GET ERROR DIALOG ');
                    progress.dismiss();
                    DialogsManager.showErrorDialog(context, (state).toString());
                  }
                },
                child: buildProfileUI(currentState.data),
              );
            }

            return const Center();
          }),
    );
  }

  void _load() {
    widget._profileBloc.add(FetchProfile());
  }

  Widget buildProfileUI(User profileData) {
    return LayoutBuilder(builder: (context, constraints) {
      final strings = context.getStrings();

      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                ProfileImagePicker(
                  onPickImage: (file) {
                    widget._profileBloc.add(UpdateProfileImage(file));
                  },
                  imagePath: profileData.getImagePath(),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildProfileItem(profileData.name.toString(),
                    icon: const Icon(
                      Icons.person,
                      color: kAccent,
                    )),
                buildProfileItem(profileData.email.toString(),
                    icon: const Icon(
                      Icons.email,
                      color: kAccent,
                    )),
                InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                  },
                  child: buildProfileItem(strings.change_password,
                      icon: const Icon(
                        Icons.vpn_key,
                        color: kAccent,
                      )),
                ),
                InkWell(
                  onTap: () {
                    DialogsManager.showLogoutDialog(context, onClickOk: () {
                      widget._profileBloc.add(LogoutEvent());
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.routeName, (route) => false);
                    });
                  },
                  child: buildProfileItem(strings.logout,
                      color: Colors.red,
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildProfileItem(String data,
      {required Widget icon, Color color = Colors.black}) {
    return MaterialText(
      data.toString(),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      style: kTextLabel.copyWith(color: color),
      startIconPadding: const EdgeInsetsDirectional.only(end: 8),
      startIcon: icon,
      decoration: Decorations.createRectangleDecoration(),
    );
  }
}

class ProfileImagePicker extends StatefulWidget {
  final Function(File) onPickImage;
  final String imagePath;

  const ProfileImagePicker({required this.onPickImage ,required this.imagePath});
  @override
  _ProfileImagePickerState createState() {
    return _ProfileImagePickerState();
  }
}

// ignore: must_be_immutable
class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final _picker = ImagePicker();
  XFile? pickedFile;
  File? file;

  pickImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(pickedFile!.path);
      widget.onPickImage(file!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: pickedFile == null
          ?  CircleAvatar(
        child: kBuildCircleImage(widget.imagePath,size: 80),
        radius: 36,
            )
          : CircleAvatar(
              backgroundImage: FileImage(file!),
              radius: 36,
            ),
      onTap: () {
        pickImage();
      },
    );
  }
}
