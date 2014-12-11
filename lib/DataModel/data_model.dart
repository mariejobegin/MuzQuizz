part of songslist;

class DataModel {
  Songs songs = new Songs();

  init(SongCategory category) {
    
    Song newSong = new Song();
    
    //TODO: Populate the wrong answers list
    
    //Populate the current pool for the selected category
    switch (category) {
      
      case SongCategory.ROCK:
        newSong.artist = "Bee Gees";
        newSong.songName = "Stayin Alive";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Bee Gees - Stayin Alive.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Def Leppard";
        newSong.songName = "Pour Some Sugar On Me";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Def Leppard - Pour Some Sugar On Me.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Eagles";
        newSong.songName = "Hotel California";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Eagles - Hotel California.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Elvis Presley";
        newSong.songName = "Jailhouse Rock";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Elvis Presley - Jailhouse Rock.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Survivor";
        newSong.songName = "Eye Of The Tiger";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Survivor - Eye Of The Tiger.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Bon jovi";
        newSong.songName = "Livin' On A Prayer";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Bon jovi - Livin' On A Prayer.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "The Police";
        newSong.songName = "Every Breath You Take";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/The Police - Every Breath You Take.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Twisted Sister";
        newSong.songName = "I Wanna Rock";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Twisted Sister - I Wanna Rock.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
            
        newSong = new Song();
        newSong.artist = "Oasis";
        newSong.songName = "Wonderwall";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Oasis - Wonderwall.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        newSong = new Song();
        newSong.artist = "Guns N' Roses";
        newSong.songName = "Paradise City";
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Guns N' Roses - Paradise City.ogg";
        newSong.category = SongCategory.ROCK;
        songs.add(newSong);
        
        break;
        
      case SongCategory.CLASSIC:
        
        //TODO: Complete the classic section!
        
    }
  }

}



