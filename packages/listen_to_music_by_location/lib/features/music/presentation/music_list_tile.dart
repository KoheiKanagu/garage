import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicListTile extends StatelessWidget {
  const MusicListTile({
    required this.title,
    required this.artworkUrl,
    required this.onTap,
    super.key,
  });

  final String title;

  final String? artworkUrl;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const leadingSize = 96.0;

    final leadingBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );

    final leadingErrorWidget = Container(
      width: leadingSize,
      height: leadingSize,
      decoration: leadingBoxDecoration,
      child: const Center(
        child: Icon(Icons.question_mark_rounded),
      ),
    );

    return CupertinoListTile.notched(
      title: Text(
        title,
        maxLines: 3,
      ),
      trailing: const CupertinoListTileChevron(),
      leadingSize: 96,
      leading: Padding(
        padding: const EdgeInsets.all(4),
        // https://github.com/Baseflow/flutter_cached_network_image/issues/821
        // の問題があるのでチェック
        child: (artworkUrl ?? '').isEmpty
            ? leadingErrorWidget
            : CachedNetworkImage(
                imageUrl: artworkUrl!,
                placeholder: (context, url) => Container(
                  width: leadingSize,
                  height: leadingSize,
                  decoration: leadingBoxDecoration,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
                errorWidget: (context, url, error) => leadingErrorWidget,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: leadingBoxDecoration.copyWith(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                fit: BoxFit.contain,
              ),
      ),
      onTap: onTap,
    );
  }
}
