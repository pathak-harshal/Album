import 'package:albums/entity/artist_entity.dart';
import 'package:floor/floor.dart';

abstract class ArtistEntityDao {
  @Query('SELECT * FROM ArtistEntity')
  Future<List<ArtistEntity>> findAllArtist();

  @insert
  Future<bool> insertArtist(List<ArtistEntity> entityList);
}
