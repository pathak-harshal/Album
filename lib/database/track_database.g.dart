// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorTrackDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TrackDatabaseBuilder databaseBuilder(String name) =>
      _$TrackDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TrackDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TrackDatabaseBuilder(null);
}

class _$TrackDatabaseBuilder {
  _$TrackDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$TrackDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TrackDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TrackDatabase> build() async {
    final database = _$TrackDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TrackDatabase extends TrackDatabase {
  _$TrackDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TrackEntityDao _trackEntityDao;
  ArtistEntityDao _artistEntityDao;
  CollectionEntityDao _collectionEntityDao;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TrackEntity` (`trackId` INTEGER, `wrapperType` TEXT, `kind` TEXT, `artistId` INTEGER, `collectionId` INTEGER, `artistName` TEXT, `collectionName` TEXT, `trackName` TEXT, `collectionCensoredName` TEXT, `trackCensoredName` TEXT, `artistViewUrl` TEXT, `collectionViewUrl` TEXT, `trackViewUrl` TEXT, `previewUrl` TEXT, `artworkUrl30` TEXT, `artworkUrl60` TEXT, `artworkUrl100` TEXT, `collectionPrice` REAL, `trackPrice` REAL, `releaseDate` TEXT, `collectionExplicitness` TEXT, `trackExplicitness` TEXT, `discCount` INTEGER, `discNumber` INTEGER, `trackCount` INTEGER, `trackNumber` INTEGER, `trackTimeMillis` INTEGER, `country` TEXT, `currency` TEXT, `primaryGenreName` TEXT, `isStreamable` INTEGER, `collectionArtistId` INTEGER, `collectionArtistName` TEXT, `collectionArtistViewUrl` TEXT, FOREIGN KEY (`collectionId`) REFERENCES `CollectionEntity` (`collectionId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`trackId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CollectionEntity` (`collectionId` INTEGER, `collectionName` TEXT, `collectionUrl` TEXT, `collectionPrice` REAL, `totalTrackCount` INTEGER, `currency` TEXT, `artistId` INTEGER, FOREIGN KEY (`artistId`) REFERENCES `ArtistEntity` (`artistId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`collectionId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ArtistEntity` (`artistId` INTEGER, `artistName` TEXT, `artistUrl` TEXT, PRIMARY KEY (`artistId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  // TODO: implement artistEntityDao
  ArtistEntityDao get artistEntityDao {
    return _artistEntityDao ??= _$ArtistEnityDao(database, changeListener);
  }

  @override
  // TODO: implement collectionEntityDao
  CollectionEntityDao get collectionEntityDao {
    return _collectionEntityDao ??=
        _$CollectionEnityDao(database, changeListener);
  }

  @override
  // TODO: implement trackEntityDao
  TrackEntityDao get trackEntityDao {
    return _trackEntityDao ??= _$TrackEntityDao(database, changeListener);
  }
}

class _$TrackEntityDao extends TrackEntityDao {
  _$TrackEntityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _trackEntityInsertionAdapter = InsertionAdapter(
            database,
            'TrackEntity',
            (TrackEntity item) => <String, dynamic>{
                  'trackId': item.trackId,
                  'wrapperType': item.wrapperType,
                  'kind': item.kind,
                  'artistId': item.artistId,
                  'collectionId': item.collectionId,
                  'artistName': item.artistName,
                  'collectionName': item.collectionName,
                  'trackName': item.trackName,
                  'collectionCensoredName': item.collectionCensoredName,
                  'trackCensoredName': item.trackCensoredName,
                  'artistViewUrl': item.artistViewUrl,
                  'collectionViewUrl': item.collectionViewUrl,
                  'trackViewUrl': item.trackViewUrl,
                  'previewUrl': item.previewUrl,
                  'artworkUrl30': item.artworkUrl30,
                  'artworkUrl60': item.artworkUrl60,
                  'artworkUrl100': item.artworkUrl100,
                  'collectionPrice': item.collectionPrice,
                  'trackPrice': item.trackPrice,
                  'releaseDate': item.releaseDate,
                  'collectionExplicitness': item.collectionExplicitness,
                  'trackExplicitness': item.trackExplicitness,
                  'discCount': item.discCount,
                  'discNumber': item.discNumber,
                  'trackCount': item.trackCount,
                  'trackNumber': item.trackNumber,
                  'trackTimeMillis': item.trackTimeMillis,
                  'country': item.country,
                  'currency': item.currency,
                  'primaryGenreName': item.primaryGenreName,
                  'isStreamable': item.isStreamable,
                  'collectionArtistId': item.collectionArtistId,
                  'collectionArtistName': item.collectionArtistName,
                  'collectionArtistViewUrl': item.collectionArtistViewUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _trackEntityMapper = (Map<String, dynamic> row) =>
      // TrackEntity(row['LocationID'] as int, row['LocationName'] as String);
      TrackEntity(
          trackId: row['trackId'] as int,
          wrapperType: row['wrapperType'] as String,
          kind: row['wrapperType'] as String,
          artistId: row['artistId'] as int,
          collectionId: row['collectionId'] as int,
          artistName: row['artistName'] as String,
          collectionName: row['collectionName'] as String,
          trackName: row['trackName'] as String,
          collectionCensoredName: row['collectionCensoredName'] as String,
          trackCensoredName: row['trackCensoredName'] as String,
          artistViewUrl: row['artistViewUrl'] as String,
          collectionViewUrl: row['collectionViewUrl'] as String,
          trackViewUrl: row['trackViewUrl'] as String,
          previewUrl: row['previewUrl'] as String,
          artworkUrl30: row['artworkUrl30'] as String,
          artworkUrl60: row['artworkUrl60'] as String,
          artworkUrl100: row['artworkUrl100'] as String,
          collectionPrice: row['collectionPrice'] as double,
          trackPrice: row['trackPrice'] as double,
          releaseDate: row['releaseDate'] as String,
          collectionExplicitness: row['collectionExplicitness'] as String,
          trackExplicitness: row['trackExplicitness'] as String,
          discCount: row['discCount'] as int,
          discNumber: row['discNumber'] as int,
          trackCount: row['trackCount'] as int,
          trackNumber: row['trackNumber'] as int,
          trackTimeMillis: row['trackTimeMillis'] as int,
          country: row['country'] as String,
          currency: row['currency'] as String,
          primaryGenreName: row['primaryGenreName'] as String,
          isStreamable: row['isStreamable'] as int == 1 ? true : false,
          collectionArtistId: row['collectionArtistId'] as int,
          collectionArtistName: row['collectionArtistName'] as String,
          collectionArtistViewUrl: row['collectionArtistViewUrl'] as String);

  final InsertionAdapter<TrackEntity> _trackEntityInsertionAdapter;

  @override
  Future<List<TrackEntity>> findAllTracks() async {
    // TODO: implement findAllTracks
    return _queryAdapter.queryList('SELECT * FROM TrackEntity',
        mapper: _trackEntityMapper);
  }

  @override
  Future<bool> insertTrack(List<TrackEntity> entityList) async {
    // TODO: implement insertTrack
    int i = 0;
    for (TrackEntity entity in entityList) {
      try {
        await _trackEntityInsertionAdapter.insert(
            entity, sqflite.ConflictAlgorithm.replace);
        i++;
      } catch (e) {}
    }

    if (i == entityList.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<TrackEntity>> collectionWiseTracks(int collectionId) {
    // TODO: implement collectionWiseTracs
    return _queryAdapter.queryList(
        'SELECT * FROM TrackEntity WHERE collectionId = ?',
        arguments: <dynamic>[collectionId],
        mapper: _trackEntityMapper);
  }
}

class _$CollectionEnityDao extends CollectionEntityDao {
  _$CollectionEnityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _collectionEntityInsertionAdapter = InsertionAdapter(
            database,
            'CollectionEntity',
            (CollectionEntity item) => <String, dynamic>{
                  'collectionId': item.collectionId,
                  'collectionName': item.collectionName,
                  'collectionUrl': item.collectionUrl,
                  'collectionPrice': item.collectionPrice,
                  'totalTrackCount': item.totalTrackCount,
                  'currency': item.currency,
                  'artistId': item.artistId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _collectionEntityMapper = (Map<String, dynamic> row) =>
      // TrackEntity(row['LocationID'] as int, row['LocationName'] as String);
      CollectionEntity(
          collectionId: row['collectionId'] as int,
          collectionName: row['collectionName'] as String,
          collectionUrl: row['collectionUrl'] as String,
          collectionPrice: row['collectionPrice'] as double,
          totalTrackCount: row['totalTrackCount'] as int,
          currency: row['currency'] as String,
          artistId: row['artistId'] as int);

  final InsertionAdapter<CollectionEntity> _collectionEntityInsertionAdapter;

  @override
  Future<List<CollectionEntity>> findAllCollections() {
    // TODO: implement findAllCollections
    return _queryAdapter.queryList('SELECT * FROM CollectionEntity',
        mapper: _collectionEntityMapper);
  }

  @override
  Future<bool> insertCollection(List<CollectionEntity> entityList) async {
    // TODO: implement insertCollection
    int i = 0;
    for (CollectionEntity entity in entityList) {
      try {
        await _collectionEntityInsertionAdapter.insert(
            entity, sqflite.ConflictAlgorithm.replace);
        i++;
      } catch (e) {}
    }

    if (i == entityList.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<CollectionEntity>> artistWiseCollections(int artistId) async {
    // TODO: implement artistWiseCollections
    return _queryAdapter.queryList(
        'SELECT * FROM CollectionEntity WHERE artistId = ?',
        arguments: <dynamic>[artistId],
        mapper: _collectionEntityMapper);
  }

  @override
  Future<int> artistWiseCollectionCount(int artistId) async {
    // TODO: implement artistWiseCollectionCount
    var list = await _queryAdapter.queryList(
        'SELECT * FROM CollectionEntity WHERE artistId = ?',
        arguments: <dynamic>[artistId],
        mapper: _collectionEntityMapper);
    return list.length;
  }
}

class _$ArtistEnityDao extends ArtistEntityDao {
  _$ArtistEnityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _artistEntityInsertionAdapter = InsertionAdapter(
            database,
            'ArtistEntity',
            (ArtistEntity item) => <String, dynamic>{
                  'artistId': item.artistId,
                  'artistName': item.artistName,
                  'artistUrl': item.artistUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _artistEntityMapper = (Map<String, dynamic> row) =>
      // TrackEntity(row['LocationID'] as int, row['LocationName'] as String);
      ArtistEntity(
          artistId: row['artistId'] as int,
          artistName: row['artistName'] as String,
          artistUrl: row['artistUrl'] as String);

  final InsertionAdapter<ArtistEntity> _artistEntityInsertionAdapter;

  @override
  Future<List<ArtistEntity>> findAllArtist() async {
    // TODO: implement findAllArtist
    return _queryAdapter.queryList('SELECT * FROM ArtistEntity',
        mapper: _artistEntityMapper);
  }

  @override
  Future<bool> insertArtist(List<ArtistEntity> entityList) async {
    // TODO: implement insertArtist
    int i = 0;
    for (ArtistEntity entity in entityList) {
      try {
        await _artistEntityInsertionAdapter.insert(
            entity, sqflite.ConflictAlgorithm.replace);
        i++;
      } catch (e) {}
    }

    if (i == entityList.length) {
      return true;
    } else {
      return false;
    }
  }
}
