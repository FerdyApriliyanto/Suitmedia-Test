import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/bloc/set_username/set_username_cubit.dart';
import 'package:suitmedia_test/constants/global_text_style.dart';
import 'package:suitmedia_test/widgets/main_button_widget.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.4,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          title: Text(
            'Second Screen',
            style: GlobalTextStyle.titleH2,
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                context.read<SetUsernameCubit>().resetState();
              },
              child: Image.asset('assets/ic_back.png')),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GlobalTextStyle.titleH4,
                    ),
                    Text(
                      user,
                      style: GlobalTextStyle.titleH2,
                    )
                  ],
                ),
              ),
              BlocBuilder<SetUsernameCubit, SetUsernameState>(
                builder: (BuildContext context, SetUsernameState state) =>
                    state is SetUsernameLoaded
                        ? Text(
                            state.selectedUsername,
                            style: GlobalTextStyle.titleH1,
                          )
                        : Text('Selected User Name',
                            style: GlobalTextStyle.titleH1),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: MainButtonWidget(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/third-screen')
                                .then((value) {
                              if (value != null) {
                                context
                                    .read<SetUsernameCubit>()
                                    .setUsername(value.toString());
                              } else {
                                context.read<SetUsernameCubit>().resetState();
                              }
                            }),
                        text: 'Choose a User'),
                  ))
            ],
          ),
        ));
  }
}
