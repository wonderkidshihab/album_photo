import 'dart:convert';

import 'package:albumapp/Data/Models/Album.dart';
import 'package:albumapp/Data/Models/Photo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static DB instance = DB();
  Database database;
  final String albums_table = 'albums';
  final String photos_table = 'photos';

  initializeDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE albums (id INTEGER PRIMARY KEY, fetched_data TEXT)');
        await db.execute(
            'CREATE TABLE photos (id INTEGER PRIMARY KEY, fetched_data TEXT)');
      },
    );
  }

  Future<List<Album>> getAlbums()async {
    try {
      var albums = await database.query(albums_table, columns: ['fetched_data']);
      List<Album> albumsList = [];
      var result = jsonDecode(albums[0]['fetched_data']);
      result.forEach((e){
        albumsList.add(Album.fromJson(e));
      });
      return albumsList;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<List<Photo>> getPhotos() async{
    try {
      var photos = await database.query(photos_table, columns: ['fetched_data']);
      List<Photo> photosList = [];
      var result = jsonDecode(photos[0]['fetched_data']);
      result.forEach((e){
        photosList.add(Photo.fromJson(e));
      });
      return photosList;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<bool> setAlbums(String data) async {
    try {
      await database.insert(albums_table, {'fetched_data':data});
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<bool> setPhotos(String data) async {
    try {
      await database.insert(photos_table, {'fetched_data':data});
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

}
