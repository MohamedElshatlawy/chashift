import 'package:flutter/material.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/presentation/profile/bloc/profile_bloc.dart';
import 'package:shiftapp/presentation/profile/pages/profile_screen.dart';
class ProfilePage extends StatefulWidget {
  static const String routeName = '/profileScreen';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final _profileScreenBloc = getKoin().get<ProfileBloc>();

    return Scaffold(
      body: ProfileScreen(profileBloc:_profileScreenBloc),
    );
  }
}
