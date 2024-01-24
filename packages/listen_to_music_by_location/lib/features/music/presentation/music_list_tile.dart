import 'package:flutter/cupertino.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: CupertinoListTile(
        title: Text(
          title,
          maxLines: 3,
        ),
        trailing: const CupertinoListTileChevron(),
        leadingSize: MusicArtworkWidget.kDefaultSize,
        leading: MusicArtworkWidget(
          artworkUrl: artworkUrl,
        ),
        onTap: onTap,
      ),
    );
  }
}
