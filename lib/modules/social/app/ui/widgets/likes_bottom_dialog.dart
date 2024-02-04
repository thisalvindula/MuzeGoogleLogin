import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/app/cubits/social_state.dart';
import 'package:muze/modules/social/app/ui/widgets/like_row.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/bottom_dialog.dart';

class LikesBottomDialog {
  Future<void> show(BuildContext context) async {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    BottomDialog.show(
      context,
      title: localizations.likes_text,
      showButtons: false,
      height: MediaQuery.of(context).size.height / 1.2,
      body: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: BlocBuilder<SocialCubit, SocialState>(
          bloc: locator<SocialCubit>(),
          builder: (context, state) {
            return state.likes != null
                ? state.likes!.content!.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.likes!.content!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              LikeRow(like: state.likes!.content![index]),
                              SizedBox(
                                height: AppSize.getHeight(context) / 50,
                              ),
                            ],
                          );
                        },
                      )
                    : const Center(child: Text("Il n'y a pas de likes pour l'instant."))
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
