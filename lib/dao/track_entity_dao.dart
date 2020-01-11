import 'package:albums/entity/track_entity.dart';
import 'package:floor/floor.dart';

abstract class TrackEntityDao {
  @Query('SELECT * FROM TrackEntity')
  Future<List<TrackEntity>> findAllTracks();

  @Query('SELECT * FROM TrackEntity WHERE collectionId = :collectionId')
  Future<List<TrackEntity>> collectionWiseTracks(int collectionId);

  @insert
  Future<bool> insertTrack(List<TrackEntity> entityList);
}
