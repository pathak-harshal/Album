import 'package:floor/floor.dart';

@entity
class ArtistEntity {
  @primaryKey
  final int artistId;
  final String artistName;
  final String artistUrl;

  ArtistEntity({this.artistId, this.artistName, this.artistUrl});
}
