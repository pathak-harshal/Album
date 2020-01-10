import 'package:albums/entity/track_entity.dart';
import 'package:floor/floor.dart';

abstract class TrackEntityDao {
  @Query('SELECT * FROM TrackEntity')
  Future<List<TrackEntity>> findAllTracks();

  @insert
  Future<void> insertTrack(TrackEntity entity);
}
