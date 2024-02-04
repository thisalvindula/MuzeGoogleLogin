import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:marquee/marquee.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';

class SwipeSelectIcon extends StatefulWidget {
  final String? imageUrl;
  final Widget? icon;
  final String title;
  final bool Function(String name)? callback;
  final bool Function()? callbackPlaylist;
  final bool selected;
  final bool? isPlaylist;
  const SwipeSelectIcon({super.key, this.imageUrl, required this.title, this.callback, required this.selected, this.icon, this.isPlaylist, this.callbackPlaylist})
      : assert(imageUrl != null || icon != null);

  @override
  State<SwipeSelectIcon> createState() => _SwipeSelectIconState();
}

class _SwipeSelectIconState extends State<SwipeSelectIcon> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        bool response = false;
        if (widget.isPlaylist ?? false) {
          response = widget.callbackPlaylist!();
        } else {
          response = widget.callback!(widget.title);
        }
        if (response) {
          setState(() {
            selected = !selected;
          });
        }
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 13,
            decoration: BoxDecoration(
              image: widget.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(widget.imageUrl!),
                      fit: BoxFit.fill,
                      colorFilter: selected
                          ? widget.isPlaylist != null && (widget.isPlaylist ?? false)
                              ? const ColorFilter.mode(Colors.black87, BlendMode.luminosity)
                              : null
                          : null)
                  : null,
              color: widget.imageUrl != null ? null : AppColors.black,
              border: Border.fromBorderSide(
                BorderSide(
                  width: selected ? 2 : 1,
                  color: selected ? AppColors.primary : AppColors.white.withOpacity(0.5),
                ),
              ),
              shape: BoxShape.circle,
            ),
            child: selected
                ? widget.isPlaylist != null && (widget.isPlaylist ?? false)
                    ? widget.icon ?? Container()
                    : Container()
                : Container(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          SizedBox(
            width: AppSize.getWidth(context) / 4,
            height: AppSize.getHeight(context) / 30,
            child: widget.title.length > 12
                ? Marquee(
                    showFadingOnlyWhenScrolling: true,
                    startAfter: Duration(milliseconds: Random().nextInt(1500) + 1000),
                    pauseAfterRound: Duration(milliseconds: Random().nextInt(1500) + 1000),
                    fadingEdgeEndFraction: 0.3,
                    blankSpace: 100,
                    velocity: 50,
                    text: widget.title.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.w700, height: 22 / 12, color: selected ? AppColors.primary[800] : AppColors.white),
                  )
                : Text(
                    widget.title.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.w700, height: 22 / 12, color: selected ? AppColors.primary[800] : AppColors.white),
                  ),
          ),
        ],
      ),
    );
  }
}
