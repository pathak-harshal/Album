import 'package:albums/entity/artist_entity.dart';
import 'package:floor/floor.dart';

@Entity(
  tableName: 'CollectionEntity',
  foreignKeys: [
    ForeignKey(
      childColumns: ['artistId'],
      parentColumns: ['artistId'],
      entity: ArtistEntity,
    )
  ],
)
@entity
class CollectionEntity {
  @primaryKey
  final int collectionId;
  final String collectionName;
  final String collectionUrl;
  final double collectionPrice;
  final int totalTrackCount;
  final String currency;
  final int artistId;

  CollectionEntity(
      {this.collectionPrice,
      this.totalTrackCount,
      this.collectionId,
      this.collectionName,
      this.collectionUrl,
      this.currency,
      this.artistId});

  @override
  String toString() {
    // TODO: implement toString
    return 'collection id $collectionId, collection name $collectionName, artist id $artistId';
  }
}
