import 'package:flutter/material.dart';
import 'package:youtube_clone/api/api.dart';
import 'package:youtube_clone/models/video.dart';

// import 'package:video_player/video_player.dart';
// import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Init extends StatefulWidget {
  String searchTerm;
  Init(this.searchTerm, {Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  String? API_KEY = dotenv.maybeGet('YOUTUBE_API_KEY', fallback: null);

  _onListVideos(String searchTerm) async {
    Api api = Api();
    return await api.onSearch(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _onListVideos(widget.searchTerm),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              var _videos = snapshot.data as List<Video>?;

              return ListView.separated(
                  itemBuilder: (context, index) {
                    Video video = _videos![index];

                    return GestureDetector(
                      onTap: () {
                        // FlutterYoutube.playYoutubeVideoById(
                        //     apiKey: API_KEY,
                        //     videoId: video.id,
                        //     autoPlay: true,
                        //     fullScreen: true
                        // );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.image))),
                          ),
                          ListTile(
                            title: Text(video.title),
                            subtitle: Text(video.channelTitle),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: _videos!.length);
            } else {
              return const Center(
                child: Text('Nenhum dado a ser exibido!'),
              );
            }
        }
      },
    );
  }
}
