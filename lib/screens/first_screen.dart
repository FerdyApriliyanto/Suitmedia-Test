import 'package:flutter/material.dart';
import 'package:suitmedia_test/constants/global_text_style.dart';
import 'package:suitmedia_test/widgets/main_button_widget.dart';
import 'package:suitmedia_test/widgets/text_field_widget.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  bool _isPalindrome(String text) {
    String checkedText = text.toLowerCase().replaceAll(RegExp(r'\s+'), '');

    return checkedText == checkedText.split('').reversed.join('');
  }

  void _showDialog({required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          msg,
          style: GlobalTextStyle.titleH2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController sentenceController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login-screen-bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/ic_photo.png'),
            const SizedBox(
              height: 50,
            ),
            TextFieldWidget(controller: nameController, hintText: 'Name'),
            const SizedBox(
              height: 14,
            ),
            TextFieldWidget(
                controller: sentenceController, hintText: 'Palindrome'),
            const SizedBox(
              height: 44,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MainButtonWidget(
                onPressed: () {
                  if (sentenceController.text.isEmpty) {
                    _showDialog(context: context, msg: 'Data is Empty');
                  } else {
                    if (_isPalindrome(sentenceController.text)) {
                      _showDialog(context: context, msg: 'Is Palindrome');
                    } else {
                      _showDialog(context: context, msg: 'Not Palindrome');
                    }
                  }
                },
                text: 'CHECK',
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MainButtonWidget(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    _showDialog(context: context, msg: 'Name is mandatory');
                  } else {
                    Navigator.pushNamed(context, '/second-screen',
                        arguments: nameController.text);
                  }
                },
                text: 'NEXT',
              ),
            )
          ],
        ),
      ),
    );
  }
}
