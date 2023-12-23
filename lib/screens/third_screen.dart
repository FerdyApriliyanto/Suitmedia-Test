import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/bloc/get_contacts/get_contacts_cubit.dart';
import 'package:suitmedia_test/constants/global_color.dart';
import 'package:suitmedia_test/constants/global_text_style.dart';
import 'package:suitmedia_test/models/contact_model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<GetContactsCubit>().getContacts();
    _scrollPagination();
  }

  void _scrollPagination() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<GetContactsCubit>().getContacts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        scrolledUnderElevation: 0.4,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'Third Screen',
          style: GlobalTextStyle.titleH2,
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/ic_back.png')),
      ),
      body: BlocBuilder<GetContactsCubit, GetContactsState>(
        builder: (BuildContext context, state) {
          if (state is GetContactsLoading && state.isFirstFetch) {
            return const Center(
                child: CircularProgressIndicator(
              color: GlobalColor.main,
            ));
          }

          List<ContactModel> contacts = [];
          bool isLoadMore = false;

          if (state is GetContactsLoading) {
            contacts = state.oldContactsData ?? [];
            isLoadMore = true;
          } else if (state is GetContactsLoaded) {
            contacts = state.contacts;
          }

          return RefreshIndicator(
            color: GlobalColor.main,
            onRefresh: () async {
              context.read<GetContactsCubit>().resetState();
              await context.read<GetContactsCubit>().getContacts();
            },
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              itemCount: contacts.length + (isLoadMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < contacts.length) {
                  final dataIndexed = contacts[index];
                  return GestureDetector(
                    onTap: () => Navigator.pop(context,
                        '${dataIndexed.firstName ?? 'No Name'} ${dataIndexed.lastName ?? ''} '),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(dataIndexed.avatar ?? ''),
                        ),
                      ),
                      title: Text(
                        '${dataIndexed.firstName ?? 'No Name'} ${dataIndexed.lastName ?? ''}',
                        style: GlobalTextStyle.titleH3
                            .copyWith(color: GlobalColor.dark),
                      ),
                      subtitle: Text(
                        (dataIndexed.email ?? 'No Email').toUpperCase(),
                        style: GlobalTextStyle.titleH5,
                      ),
                    ),
                  );
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  });
                }

                return const Center(
                  child: CircularProgressIndicator(
                    color: GlobalColor.main,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: GlobalColor.separatorColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
