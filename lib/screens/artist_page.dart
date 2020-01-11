import 'package:albums/dao/artist_entity_dao.dart';
import 'package:albums/dao/collection_entity_dao.dart';
import 'package:albums/dao/track_entity_dao.dart';
import 'package:albums/database/track_database.dart';
import 'package:albums/entity/artist_entity.dart';
import 'package:albums/entity/collection_entity.dart';
import 'package:albums/screens/collection_page.dart';
import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  ArtistPage({Key key}) : super(key: key);

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List<ArtistEntity> list = new List<ArtistEntity>();

  static TrackDatabase database;
  static ArtistEntityDao artistEntityDao;
  static CollectionEntityDao collectionEntityDao;
  static TrackEntityDao trackEntityDao;

  List<int> collectionCount = List<int>();
  List<int> trackCount = List<int>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArtists();
  }

  void getArtists() async {
    database =
        await $FloorTrackDatabase.databaseBuilder('track_database.db').build();
    artistEntityDao = database.artistEntityDao;
    collectionEntityDao = database.collectionEntityDao;
    trackEntityDao = database.trackEntityDao;

    var intrimList = await artistEntityDao.findAllArtist();

    setState(() {
      list = intrimList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return artistCard(list[index]);
        },
      ),
    );
  }

  Widget artistCard(ArtistEntity artistEntity) {
    return GestureDetector(
      onTap: () {
        navigateToCollectionPage(artistEntity);
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/artist_placeholder.jpeg',
              image: artistEntity.artistUrl,
              imageScale: 1.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  artistEntity.artistName,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateToCollectionPage(ArtistEntity artistEntity) async {
    List<CollectionEntity> list =
        await collectionEntityDao.artistWiseCollections(artistEntity.artistId);
    Navigator.of(context).push(
      new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return CollectionPage(
            listCollection: list,
            artitsName: artistEntity.artistName,
          );
        },
      ),
    );
  }
}
