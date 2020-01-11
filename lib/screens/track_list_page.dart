import 'package:albums/entity/track_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackListPage extends StatefulWidget {
  TrackListPage({Key key, this.collectionName, this.tracksList})
      : super(key: key);
  final String collectionName;
  final List<TrackEntity> tracksList;

  @override
  _TrackListPageState createState() => _TrackListPageState(
      collectionName: collectionName, tracksList: tracksList);
}

class _TrackListPageState extends State<TrackListPage> {
  final String collectionName;
  final List<TrackEntity> tracksList;

  _TrackListPageState({this.collectionName, this.tracksList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
      ),
      body: ListView.builder(
        itemCount: tracksList.length,
        itemBuilder: (context, index) {
          return trackCard(tracksList[index]);
        },
      ),
    );
  }

  Widget trackCard(TrackEntity trackEntity) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/artist_placeholder.jpeg',
                image: trackEntity.artworkUrl30,
                imageScale: 1.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        trackEntity.trackName,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            'Total Time: ${_printDuration(Duration(milliseconds: trackEntity.trackTimeMillis))}',
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          trackEntity.isStreamable
                              ? 'Streamable'
                              : 'Not Streamable',
                          style: TextStyle(
                              color: trackEntity.isStreamable
                                  ? Colors.lightGreen
                                  : Colors.redAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
