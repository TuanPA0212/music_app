import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/song.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key, required this.playingSong, required this.songs});

  final Song playingSong;
  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return NowPlayingPage(playingSong: playingSong, songs: songs);
  }
}

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage(
      {super.key, required this.playingSong, required this.songs});

  final Song playingSong;
  final List<Song> songs;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageAnimContronller;

  @override
  void initState() {
    super.initState();
    _imageAnimContronller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 12000));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const delta = 64;
    final radius = (screenWidth - delta) / 2;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("Now Playing"),
          trailing: IconButton(
              onPressed: () => {}, icon: const Icon(Icons.more_horiz)),
        ),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.playingSong.title,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("_ ___ _"),
                const SizedBox(
                  height: 48,
                ),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0)
                      .animate(_imageAnimContronller),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/itune_logo.png",
                      image: widget.playingSong.image,
                      width: screenWidth - delta,
                      height: screenWidth - delta,
                      imageErrorBuilder: (context, error, stacktrace) {
                        return Image.asset(
                          "assets/itune_logo.png",
                          width: screenWidth - delta,
                          height: screenWidth - delta,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64, bottom: 16),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.playingSong.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                            ),
                            const SizedBox(height: 8),
                            Text(widget.playingSong.artist,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline),
                            color: Theme.of(context).colorScheme.primary),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
