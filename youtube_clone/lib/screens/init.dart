import 'package:flutter/material.dart';
import 'package:youtube_clone/api/api.dart';
import 'package:youtube_clone/models/video.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  _onListVideos() {
    Api api = Api();
    return api.onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _onListVideos(),
      builder: (contex, snapshot) {
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

                    return Column(
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
                          subtitle: Text(video.description),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: _videos!.length);
            } else {
              return const Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
        }
      },
    );
  }
}
