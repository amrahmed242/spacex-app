import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../ui/styles/styles.dart';
import '../../../../ui/widgets/app_card.dart';

class YoutubeWidget extends StatelessWidget {
  final String videoId;
  final YoutubePlayerController controller;
  const YoutubeWidget({Key key, this.controller, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 32),
          SizedBox(width: 5),
          Text("LAUNCH VIDEO", style: TextStyle(fontSize: 36)),
        ]),
        AppCard(
          widget: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: AppColors.accentColor,
            progressColors: ProgressBarColors(
              playedColor: AppColors.accentColor,
              bufferedColor: AppColors.accentColor,
              handleColor: AppColors.accentColor,
            ),
            bottomActions: [],
            thumbnail: SizedBox(),
            onReady: () {
              // controller.load(videoId);
            },
          ),
        ),
      ],
    );
  }
}
