import 'dart:async';

import 'package:exemplo_youtube_curso/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:exemplo_youtube_curso/models/video.dart';

class VideosBloc implements BlocBase {
  Api api;

  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    print(search);
    videos = await api.search(search);
    _videosController.sink.add(videos);
    print(videos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
