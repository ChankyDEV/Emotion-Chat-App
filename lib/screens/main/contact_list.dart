import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injectable_init.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () => BlocProvider.of<AuthCubit>(context).logout(),
          child: Column(children: [
            Text(getIt<IUserRepository>().currentUser!.value.uid),
            Text(
                getIt<IUserRepository>().currentUser!.value.emailAddress.value),
            Text(getIt<IUserRepository>().currentUser!.value.phoneNumber.value)
          ]),
        ),
      ),
    );
  }
}
