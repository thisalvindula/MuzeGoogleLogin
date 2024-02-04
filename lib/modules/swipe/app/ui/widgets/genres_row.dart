import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_state.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_select_icons.dart';
import 'package:muze/widgets/custom_snackbar.dart';

class GenresRow extends StatefulWidget {
  final bool Function(String name) callback;
  const GenresRow({super.key, required this.callback});

  @override
  State<GenresRow> createState() => _GenresRowState();
}

class _GenresRowState extends State<GenresRow> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Text(
              localizations.filter_genre_text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w700, height: 16 / 15),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6.5,
          child: BlocBuilder<SwipeCubit, SwipeState>(
            bloc: locator<SwipeCubit>()
              ..clearGenres()
              ..getGenres(),
            builder: (context, state) {
              return state.genres.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.genres.length,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return SwipeSelectIcon(
                          imageUrl: state.genres[index][1],
                          title: state.genres[index][0],
                          selected: state.selectedGenres.contains(state.genres[index][0]),
                          callback: (String name) {
                            bool response = widget.callback(name);
                            if (!response) {
                              CustomSnackBar(context, text: localizations.select_genres_error_text);
                            }
                            return response;
                          },
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
