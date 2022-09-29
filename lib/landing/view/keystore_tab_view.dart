import 'package:flutter/material.dart';
import 'package:genius_wallet/landing/widgets/paste_field.dart';
import 'package:genius_wallet/widgets/components/text_entry_field.g.dart';

class KeystoreTabView extends StatelessWidget {
  final TextEditingController pasteFieldController;
  final TextEditingController passwordController;
  const KeystoreTabView({
    Key? key,
    required this.pasteFieldController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasteField(
      controller: pasteFieldController,
      hintText: 'Keystore JSON',
      additionalWidget: SizedBox(
        height: 50,
        child: LayoutBuilder(builder: (context, constraints) {
          return TextEntryField(
            constraints,
            ovrTextEntryHinthinttext: 'Password',
          );
        }),
      ),
      subtitle:
          'Several lines of text beginning with “{...}” plus the password you used to encrypt it',
    );
  }
}
