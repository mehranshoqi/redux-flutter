import 'package:bbloginredux/model/activity_model.dart';

class Playlist {
  String imageUrl;
  String city;
  List<Activity> activities;

  Playlist({
    this.imageUrl,
    this.city,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Playlist> playlists = [
  Playlist(
      imageUrl: 'assets/images/playlistbg1.jpg',
      city: 'playlist 1',
      activities: activities),
  Playlist(
      imageUrl: 'assets/images/playlistbg2.jpg',
      city: 'playlist 2',
      activities: activities),
  Playlist(
      imageUrl: 'assets/images/playlistbg3.jpg',
      city: 'playlist 3',
      activities: activities),
  Playlist(
      imageUrl: 'assets/images/playlistbg4.jpg',
      city: 'playlist 4',
      activities: activities),
];
