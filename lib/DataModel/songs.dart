part of songslist;

class Song {
  String artist;
  String songName;
  String songPath;
  SongCategory category;
  List <String> wrongAnswers = new List <String>();

  String get fullName => '${artist} - ${songName}';

  String toString() {
    return '  {\n'
           '    artist: ${artist}\n'
           '    songName: ${songName}\n'
           '    songPath: ${songPath}\n'
           '  }\n';
  }

}

class Songs {
  List<Song> list = new List();
  List<Song> wrongAnswers = new List<Song>();

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
  }
  
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

