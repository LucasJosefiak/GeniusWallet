import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_wallet/app/bloc/app_bloc.dart';
import 'package:genius_wallet/app/widgets/app_screen_view.dart';
import 'package:genius_wallet/onboarding/new_wallet/bloc/new_wallet_bloc.dart';
import 'package:genius_wallet/widgets/components/continue_button/isactive_false.g.dart';
import 'package:genius_wallet/widgets/components/continue_button/isactive_true.g.dart';
import 'package:genius_wallet/widgets/components/custom/wallet_agreement_custom.dart';
import 'package:genius_wallet/widgets/components/registration_header.g.dart';

class BackupPhraseScreen extends StatelessWidget {
  const BackupPhraseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreenView(
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: LayoutBuilder(builder: (context, constraints) {
                return RegistrationHeader(constraints);
              }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Image.asset(
              'assets/images/shield_icon.png',
              package: 'genius_wallet',
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return WalletAgreementCustom(
                    value: context.watch<NewWalletBloc>().state.acceptedWarning,
                    onChanged: (value) {
                      context.read<NewWalletBloc>().add(ToggleCheckbox());
                    },
                    text:
                        'I understand that if I lose my recovery words, I will not be able to access my wallet.',
                  );
                },
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
        footer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 46,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BlocBuilder<NewWalletBloc, NewWalletState>(
                builder: (context, state) {
                  if (state.acceptedWarning) {
                    return MaterialButton(
                      onPressed: () {
                        context.read<NewWalletBloc>().add(
                              AgreementAccepted(
                                userExists:
                                    context.read<AppBloc>().state.userStatus ==
                                        UserStatus.exists,
                              ),
                            );
                      },
                      child: IsactiveTrue(constraints),
                    );
                  }
                  return IsactiveFalse(constraints);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
