import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicArtworkWidget extends StatelessWidget {
  const MusicArtworkWidget({
    required this.artworkUrl,
    super.key,
  });

  final String? artworkUrl;

  static const kDefaultSize = 64.0;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: CupertinoTheme.of(context).barBackgroundColor,
      border: Border.all(
        color: CupertinoColors.systemGrey5.resolveFrom(context),
      ),
    );

    final widget = Container(
      constraints: const BoxConstraints(
        minHeight: kDefaultSize,
        minWidth: kDefaultSize,
      ),
      decoration: decoration,
      child: const Center(
        child: Icon(Icons.question_mark_rounded),
      ),
    );

    // https://github.com/Baseflow/flutter_cached_network_image/issues/821
    // の問題があるのでURLをチェック
    return (artworkUrl ?? '').isEmpty
        ? widget
        : CachedNetworkImage(
            imageUrl: artworkUrl!,
            placeholder: (context, url) => Container(
              decoration: decoration,
              constraints: const BoxConstraints(
                minHeight: kDefaultSize,
                minWidth: kDefaultSize,
              ),
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            errorWidget: (context, url, error) => widget,
            imageBuilder: (context, imageProvider) => Container(
              decoration: decoration.copyWith(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
