import 'package:albums/entity/collection_entity.dart';
import 'package:floor/floor.dart';

abstract class CollectionEntityDao {
  @Query('SELECT * FROM CollectionEntity')
  Future<List<CollectionEntity>> findAllCollections();

  @Query('SELECT * FROM CollectionEntity WHERE artistId = :artistId')
  Future<List<CollectionEntity>> artistWiseCollections(int artistId);


  @insert
  Future<bool> insertCollection(List<CollectionEntity> entityList);
}
