import 'dart:async';
import 'dart:convert';

import 'package:albums/custom_widget/platform_alert_dialog.dart';
import 'package:albums/dao/artist_entity_dao.dart';
import 'package:albums/dao/collection_entity_dao.dart';
import 'package:albums/dao/track_entity_dao.dart';
import 'package:albums/database/track_database.dart';
import 'package:albums/entity/artist_entity.dart';
import 'package:albums/entity/collection_entity.dart';
import 'package:albums/entity/track_entity.dart';
import 'package:albums/entity/track_list_api_response.dart';
import 'package:albums/screens/artist_page.dart';
import 'package:albums/util/connection_detector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  static TrackDatabase database;
  static TrackEntityDao trackEntityDao;
  static ArtistEntityDao artistEntityDao;
  static CollectionEntityDao collectionEntityDao;
  // BuildContext context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    $FloorTrackDatabase
        .databaseBuilder('track_database.db')
        .build()
        .then((dbValue) {
      database = dbValue;
      trackEntityDao = dbValue.trackEntityDao;
      artistEntityDao = dbValue.artistEntityDao;
      collectionEntityDao = dbValue.collectionEntityDao;
    });

    // context = context;
    startTheProcess();
  }

  void startTheProcess() async {
    bool isAvailable = await ConnectionDetector.checkInternetConnection();
    if (isAvailable) {
      startTime();
    } else {
      PlatformAlertDialog(
        title: 'No Internet Connection',
        content:
            'Internet Connection is not available, Please close the app check the Internet Connection and Restart the app again',
        defaultActionText: 'Ok',
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: EdgeInsets.all(20.0),
        child: new Center(
          child: new Image.asset('assets/jacson_home.jpg'),
        ),
      ),
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, getTracksFromAPI);
  }

  void getTracksFromAPI() {
    http
        .get('https://itunes.apple.com/search?term=Michael+jackson')
        .then((response) async {
      print('response ${response.body.trim()}');
      TracklListApiResponse trackListResponse =
          TracklListApiResponse.fromJson(json.decode(response.body.trim()));
      // print(('list length ${trackListResponse.results.length}'));
      List<ArtistEntity> listArtist = List<ArtistEntity>();
      List<CollectionEntity> listCollection = List<CollectionEntity>();
      List<TrackEntity> trackList = trackListResponse.results;

      for (TrackEntity trackEntity in trackList) {
        var artistEntiy = listArtist.firstWhere(
            (artist) => artist.artistId == trackEntity.artistId,
            orElse: () => null);

        if (artistEntiy == null) {
          listArtist.add(ArtistEntity(
              artistId: trackEntity.artistId,
              artistName: trackEntity.artistName,
              artistUrl: trackEntity.artworkUrl100));
        }

        var collectionEntity = listCollection.firstWhere(
            (collection) => collection.collectionId == trackEntity.collectionId,
            orElse: () => null);

        if (collectionEntity == null) {
          listCollection.add(CollectionEntity(
              collectionId: trackEntity.collectionId,
              collectionName: trackEntity.collectionName,
              collectionPrice: trackEntity.collectionPrice,
              collectionUrl: trackEntity.artworkUrl60,
              artistId: trackEntity.artistId,
              currency: trackEntity.currency));
        }
      }

      bool isArtistInserted = await artistEntityDao.insertArtist(listArtist);

      bool isCollectionInserted =
          await collectionEntityDao.insertCollection(listCollection);

      bool isAllTrackInserted =
          await trackEntityDao.insertTrack(trackListResponse.results);
      var list = await trackEntityDao.findAllTracks();
      print('length ${list.length}');
      var list2 = await artistEntityDao.findAllArtist();
      print('artist length ${list2.length}');

      var list3 = await collectionEntityDao.findAllCollections();
      print('collection length ${list3.length}');
      if (isArtistInserted && isCollectionInserted && isAllTrackInserted) {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return ArtistPage();
            },
          ),
        );
      }
    });
  }
}
