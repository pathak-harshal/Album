import 'package:albums/dao/track_entity_dao.dart';
import 'package:albums/database/track_database.dart';
import 'package:albums/entity/collection_entity.dart';
import 'package:albums/entity/track_entity.dart';
import 'package:albums/screens/track_list_page.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  CollectionPage({Key key, this.listCollection, this.artitsName})
      : super(key: key);
  final List<CollectionEntity> listCollection;
  final String artitsName;

  @override
  _CollectionPageState createState() => _CollectionPageState(
      listCollection: listCollection, artitsName: artitsName);
}

class _CollectionPageState extends State<CollectionPage> {
  final List<CollectionEntity> listCollection;
  final String artitsName;

  static TrackDatabase database;
  static TrackEntityDao trackEntityDao;

  _CollectionPageState({this.listCollection, this.artitsName});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$artitsName's Collections"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: listCollection.length,
          itemBuilder: (context, index) {
            return collectionCard(listCollection[index]);
          },
        ),
      ),
    );
  }

  Widget collectionCard(CollectionEntity collectionEntity) {
    return GestureDetector(
      onTap: () {
        navigateToTrackListPage(collectionEntity);
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/artist_placeholder.jpeg',
                image: collectionEntity.collectionUrl,
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
                        collectionEntity.collectionName,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Flexible(
                      child: Text(
                        'Collection Price: ${collectionEntity.collectionPrice} ${collectionEntity.currency}',
                        overflow: TextOverflow.clip,
                      ),
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

  void navigateToTrackListPage(CollectionEntity entity) async {
    database =
        await $FloorTrackDatabase.databaseBuilder('track_database.db').build();

    trackEntityDao = database.trackEntityDao;

    List<TrackEntity> list =
        await trackEntityDao.collectionWiseTracks(entity.collectionId);

    Navigator.of(context).push(
      new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return TrackListPage(
            tracksList: list,
            collectionName: entity.collectionName,
          );
        },
      ),
    );
  }
}
