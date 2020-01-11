import 'package:albums/entity/collection_entity.dart';
import 'package:floor/floor.dart';

@Entity(
  tableName: 'TrackEntity',
  foreignKeys: [
    ForeignKey(
      childColumns: ['collectionId'],
      parentColumns: ['collectionId'],
      entity: CollectionEntity,
    )
  ],
)
@entity
class TrackEntity {
  @primaryKey
  final int trackId;
  final String wrapperType;
  final String kind;
  final int artistId;
  final int collectionId;
  final String artistName;
  final String collectionName;
  final String trackName;
  final String collectionCensoredName;
  final String trackCensoredName;
  final String artistViewUrl;
  final String collectionViewUrl;
  final String trackViewUrl;
  final String previewUrl;
  final String artworkUrl30;
  final String artworkUrl60;
  final String artworkUrl100;
  final double collectionPrice;
  final double trackPrice;
  final String releaseDate;
  final String collectionExplicitness;
  final String trackExplicitness;
  final int discCount;
  final int discNumber;
  final int trackCount;
  final int trackNumber;
  final int trackTimeMillis;
  final String country;
  final String currency;
  final String primaryGenreName;
  final bool isStreamable;
  final int collectionArtistId;
  final String collectionArtistName;
  final String collectionArtistViewUrl;

  TrackEntity(
      {this.trackId,
      this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.isStreamable,
      this.collectionArtistId,
      this.collectionArtistName,
      this.collectionArtistViewUrl});

  factory TrackEntity.fromJson(Map<String, dynamic> json) => TrackEntity(
        wrapperType: json["wrapperType"] == null ? null : json["wrapperType"],
        kind: json["kind"] == null ? null : json["kind"],
        artistId: json["artistId"] == null ? null : json["artistId"],
        collectionId:
            json["collectionId"] == null ? null : json["collectionId"],
        trackId: json["trackId"] == null ? null : json["trackId"],
        artistName: json["artistName"] == null ? null : json["artistName"],
        collectionName:
            json["collectionName"] == null ? null : json["collectionName"],
        trackName: json["trackName"] == null ? null : json["trackName"],
        collectionCensoredName: json["collectionCensoredName"] == null
            ? null
            : json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"] == null
            ? null
            : json["trackCensoredName"],
        artistViewUrl:
            json["artistViewUrl"] == null ? null : json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"] == null
            ? null
            : json["collectionViewUrl"],
        trackViewUrl:
            json["trackViewUrl"] == null ? null : json["trackViewUrl"],
        previewUrl: json["previewUrl"] == null ? null : json["previewUrl"],
        artworkUrl30:
            json["artworkUrl30"] == null ? null : json["artworkUrl30"],
        artworkUrl60:
            json["artworkUrl60"] == null ? null : json["artworkUrl60"],
        artworkUrl100:
            json["artworkUrl100"] == null ? null : json["artworkUrl100"],
        collectionPrice: json["collectionPrice"] == null
            ? null
            : json["collectionPrice"].toDouble(),
        trackPrice:
            json["trackPrice"] == null ? null : json["trackPrice"].toDouble(),
        releaseDate: json["releaseDate"] == null ? null : json["releaseDate"],
        collectionExplicitness: json["collectionExplicitness"] == null
            ? null
            : json["collectionExplicitness"],
        trackExplicitness: json["trackExplicitness"] == null
            ? null
            : json["trackExplicitness"],
        discCount: json["discCount"] == null ? null : json["discCount"],
        discNumber: json["discNumber"] == null ? null : json["discNumber"],
        trackCount: json["trackCount"] == null ? null : json["trackCount"],
        trackNumber: json["trackNumber"] == null ? null : json["trackNumber"],
        trackTimeMillis:
            json["trackTimeMillis"] == null ? null : json["trackTimeMillis"],
        country: json["country"] == null ? null : json["country"],
        currency: json["currency"] == null ? null : json["currency"],
        primaryGenreName:
            json["primaryGenreName"] == null ? null : json["primaryGenreName"],
        isStreamable:
            json["isStreamable"] == null ? null : json["isStreamable"],
        collectionArtistId: json["collectionArtistId"] == null
            ? null
            : json["collectionArtistId"],
        collectionArtistName: json["collectionArtistName"] == null
            ? null
            : json["collectionArtistName"],
        collectionArtistViewUrl: json["collectionArtistViewUrl"] == null
            ? null
            : json["collectionArtistViewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType == null ? null : wrapperType,
        "kind": kind == null ? null : kind,
        "artistId": artistId == null ? null : artistId,
        "collectionId": collectionId == null ? null : collectionId,
        "trackId": trackId == null ? null : trackId,
        "artistName": artistName == null ? null : artistName,
        "collectionName": collectionName == null ? null : collectionName,
        "trackName": trackName == null ? null : trackName,
        "collectionCensoredName":
            collectionCensoredName == null ? null : collectionCensoredName,
        "trackCensoredName":
            trackCensoredName == null ? null : trackCensoredName,
        "artistViewUrl": artistViewUrl == null ? null : artistViewUrl,
        "collectionViewUrl":
            collectionViewUrl == null ? null : collectionViewUrl,
        "trackViewUrl": trackViewUrl == null ? null : trackViewUrl,
        "previewUrl": previewUrl == null ? null : previewUrl,
        "artworkUrl30": artworkUrl30 == null ? null : artworkUrl30,
        "artworkUrl60": artworkUrl60 == null ? null : artworkUrl60,
        "artworkUrl100": artworkUrl100 == null ? null : artworkUrl100,
        "collectionPrice": collectionPrice == null ? null : collectionPrice,
        "trackPrice": trackPrice == null ? null : trackPrice,
        "releaseDate": releaseDate == null ? null : releaseDate,
        "collectionExplicitness":
            collectionExplicitness == null ? null : collectionExplicitness,
        "trackExplicitness":
            trackExplicitness == null ? null : trackExplicitness,
        "discCount": discCount == null ? null : discCount,
        "discNumber": discNumber == null ? null : discNumber,
        "trackCount": trackCount == null ? null : trackCount,
        "trackNumber": trackNumber == null ? null : trackNumber,
        "trackTimeMillis": trackTimeMillis == null ? null : trackTimeMillis,
        "country": country == null ? null : country,
        "currency": currency == null ? null : currency,
        "primaryGenreName": primaryGenreName == null ? null : primaryGenreName,
        "isStreamable": isStreamable == null ? null : isStreamable,
        "collectionArtistId":
            collectionArtistId == null ? null : collectionArtistId,
        "collectionArtistName":
            collectionArtistName == null ? null : collectionArtistName,
        "collectionArtistViewUrl":
            collectionArtistViewUrl == null ? null : collectionArtistViewUrl,
      };
}
