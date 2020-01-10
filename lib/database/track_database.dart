 import 'dart:async';
 import 'package:albums/dao/track_entity_dao.dart';
import 'package:albums/entity/track_entity.dart';
 import 'package:floor/floor.dart';
 import 'package:path/path.dart';
 import 'package:sqflite/sqflite.dart' as sqflite;   


 part 'track_database.g.dart';

 @Database(version: 1, entities: [TrackEntity])
 abstract class TrackDatabase extends FloorDatabase {
   TrackEntityDao get trackEntityDao;
 }