import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_state.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_select_icons.dart';
import 'package:muze/modules/swipe/data/dtos/playlist_dto.dart';
import 'package:muze/utils/app_size.dart';

class PlaylistRow extends StatefulWidget {
  final bool Function(PlaylistDto playlist) callback;
  const PlaylistRow({super.key, required this.callback});

  @override
  State<PlaylistRow> createState() => _PlaylistRowState();
}

class _PlaylistRowState extends State<PlaylistRow> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Text(
              localizations.add_to_playlist_text,
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
              ..changeHavePlaylists(true)
              ..clearPlaylists()
              ..getPlaylists(),
            builder: (context, state) {
              log("selected playlists : ");
              for (PlaylistDto playlist in state.selectedPlaylists) {
                log("${playlist.name}");
              }
              log("end selected playlists");
              return state.playlists.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.playlists.length,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return state.playlists[index].name != "Muze"
                            ? SwipeSelectIcon(
                                icon: const Icon(Icons.check),
                                isPlaylist: true,
                                imageUrl: state.playlists[index].image!.url ?? "",
                                title: state.playlists[index].name ?? "",
                                selected: state.selectedPlaylists.any((element) => element.id == state.playlists[index].id),
                                callbackPlaylist: () => widget.callback.call(state.playlists[index]),
                              )
                            : Container();
                      },
                    )
                  : state.havePlaylists
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            SizedBox(
                              height: AppSize.getHeight(context) / 80,
                            ),
                            Text(
                              localizations.not_logged_to_spotify_text,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
                            ),
                          ],
                        );
            },
          ),
        )
      ],
    );
  }
}
