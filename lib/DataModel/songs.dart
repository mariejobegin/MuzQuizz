part of songslist;

// Information that represents a song
class Song {
  
  String artist;
  String songName;
  String songPath;
  SongCategory category;
  var wrongAnswers = new List <String>();

  String get fullName => '${artist} - ${songName}';
  
  Song(String _artist, String _songName)
  {
    artist = _artist;
    songName = _songName;
  }

  String toString() {
    return '  {\n'
           '    artist: ${artist}\n'
           '    songName: ${songName}\n'
           '    songPath: ${songPath}\n'
           '  }\n';
  }

}

// Collection of the class Song
class Songs {
  var list = new List();
  var wrongAnswers = new List<Song>();

  int get count => list.length;

  Iterator get iterator => list.iterator;

  forEach(Function f) {
    list.forEach(f);
  }

  add(Song member) {
    list.add(member);
  }

  Song find(String songName) {
    
    for (Song e in list) {
      if (e.songName == songName) {
        return e;
      }
    }
    
    return null;
    
  }
  
  // Give a random song in the current list songs
  Song randomSong() {
    int randomInt = new math.Random().nextInt(list.length - 1);
    return list[randomInt];
  }

  remove(Song member) {
    list.remove(member);
  }

  display([String title='Songs']) {
    print('');
    print(title);
    print('[');
    forEach((e) => print(e.toString()));
    print(']');
    print('');
  }
}

