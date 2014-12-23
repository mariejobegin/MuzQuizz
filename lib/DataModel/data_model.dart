part of songslist;

class DataModel {
  Songs songs = new Songs();
  Songs wrongAnswers = new Songs();

  // Populate the game song database based on the category
  init(SongCategory category) {
    
    Song newSong;
    
    //Populate the current pool for the selected category
    switch (category) {
      
      case SongCategory.ROCK:
        
        newSong = new Song("Bee Gees", "Stayin Alive");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Bee Gees - Stayin Alive.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Def Leppard", "Pour Some Sugar On Me");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Def Leppard - Pour Some Sugar On Me.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Eagles", "Hotel California");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Eagles - Hotel California.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Elvis Presley", "Jailhouse Rock");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Elvis Presley - Jailhouse Rock.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Survivor", "Eye Of The Tiger");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Survivor - Eye Of The Tiger.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Bon jovi", "Livin' On A Prayer");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Bon jovi - Livin' On A Prayer.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("The Police", "Every Breath You Take");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/The Police - Every Breath You Take.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Twisted Sister", "I Wanna Rock");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Twisted Sister - I Wanna Rock.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
            
        newSong = new Song("Oasis", "Wonderwall");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Oasis - Wonderwall.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Guns N' Roses","Paradise City");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Rock/Guns N' Roses - Paradise City.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        // From here, only wrong answers
        wrongAnswers.add( new Song("AC/DC","Back In Black"));
        wrongAnswers.add( new Song("Deep Purple","Child In Time"));
        wrongAnswers.add( new Song("Whitesnake","Here I Go Again"));
        wrongAnswers.add( new Song("Nirvana","Smell Like Teen Spirit"));
        wrongAnswers.add( new Song("Metallica","One"));
        wrongAnswers.add( new Song("Steppenwolf","Born To Be Wild"));
        wrongAnswers.add( new Song("Alice Cooper","Poison"));
        wrongAnswers.add( new Song("The Rolling Stone","Satisfaction"));
        wrongAnswers.add( new Song("Pink Floyd","Money"));
        wrongAnswers.add( new Song("Black Sabbath","Paranoid"));
        wrongAnswers.add( new Song("Jimi Hendrix","Hey Joe"));
        wrongAnswers.add( new Song("Bob Dylan","Knocking On Heavens Door"));
        wrongAnswers.add( new Song("John Lennon","Imagine"));
        wrongAnswers.add( new Song("Rage Against the Machine","Killing In The Name Of"));
        wrongAnswers.add( new Song("Twisted Sister","Were Not Gonna Take It"));
        wrongAnswers.add( new Song("Joan Jett","I Love Rock'n Roll"));
        wrongAnswers.add( new Song("Europe","The Final Countdown"));
        wrongAnswers.add( new Song("U2","With Or Without You"));
        wrongAnswers.add( new Song("Van Halen","Jump"));
        wrongAnswers.add( new Song("Kiss","Heaven On Fire"));
        wrongAnswers.add( new Song("Aerosmith","Sweet Emotion"));
        wrongAnswers.add( new Song("Led Zepplin","Kashmir"));
        wrongAnswers.add( new Song("The Beatles","A Day In The Life"));
        wrongAnswers.add( new Song("Queen","Bohemian Rhapsody"));
        wrongAnswers.add( new Song("Pink Floyd","Comfortably Numb"));
        wrongAnswers.add( new Song("The Who","Baba O'Riley"));
        wrongAnswers.add( new Song("Guns N'Roses","Sweet Child O'Mine"));
        wrongAnswers.add( new Song("Journey","Don't Stop Believin"));
        wrongAnswers.add( new Song("Lynyrd Skynyrd","Sweet Home Alabama"));
        wrongAnswers.add( new Song("Ozzy Osbourne","Crazy Train"));
        
        break;
        
      case SongCategory.CLASSIC:
        
        newSong = new Song("Vivaldi", "Andante");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic\Vivaldi - Andante.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Camille Saint-Saens", "Aquarium");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Camille Saint-Saens - Aquarium.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Schubert", "Ave Maria");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Schubert_-_Ave_Maria_Opera.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Vivaldi", "Four seasons");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Vivaldi - Four Seasons (Winter).ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Offenbach", "Infernal Galop");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Offenbach - Infernal Galop.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Mozart", "Les noces de Figaro");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Mozart - Les noces de Figaro K492 Ouverture.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Luigi Boccherini", "Minuetto");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Luigi Boccherini- Minuetto.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Strauss", "Radetzky March");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Strauss - Radetzky March - Karajan.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
            
        newSong = new Song("Richard Wagner", "Ride Of The Valkyries");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Richard Wagner - Ride Of The Valkyries.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        newSong = new Song("Scott Joplin","The Entertainer");
        newSong.songPath = "packages/MuzQuizz/Sounds/PlayLists/Classic/Scott Joplin - The Entertainer.ogg";
        newSong.category = category;
        songs.add(newSong);
        wrongAnswers.add(newSong);
        
        // From here, only wrong answers
        wrongAnswers.add( new Song("Bach","Air in G"));
        wrongAnswers.add( new Song("Claude DeBussy","Arabesque"));
        wrongAnswers.add( new Song("Pachelbel","Canon in D"));
        wrongAnswers.add( new Song("Claude DeBussy","Claire de Lune"));
        wrongAnswers.add( new Song("Ponchielli","Dance of the Hours"));
        wrongAnswers.add( new Song("Fucik","Entry of The Gladiators"));
        wrongAnswers.add( new Song("Grieg","Fairy Dance"));
        wrongAnswers.add( new Song("Beethoven","Fur Elise"));
        wrongAnswers.add( new Song("Georges Bizet","Habenara"));
        wrongAnswers.add( new Song("Haendel","Hallelujah"));
        wrongAnswers.add( new Song("Holst","Jupiter"));
        wrongAnswers.add( new Song("Brahms","Lullaby"));
        wrongAnswers.add( new Song("Listz","Mephisto Waltz"));
        wrongAnswers.add( new Song("Chopin","Minute Waltz"));
        wrongAnswers.add( new Song("Beethoven","Moonlight Sonata"));
        wrongAnswers.add( new Song("Grieg","Morning"));
        wrongAnswers.add( new Song("Beethoven","Pathetique"));
        wrongAnswers.add( new Song("Ravel","Pavane"));
        wrongAnswers.add( new Song("Marc Elgar","Pomp and Circumstance"));
        wrongAnswers.add( new Song("Gardel","Por Una Cabeza"));
        wrongAnswers.add( new Song("Bach","Prelude in C"));
        wrongAnswers.add( new Song("Rondeau","Mouret"));
        wrongAnswers.add( new Song("Waldenteufel","The Skaters"));
        wrongAnswers.add( new Song("Gruber","Stille Nacht"));
        wrongAnswers.add( new Song("Haydn","Surprise Symphony"));
        wrongAnswers.add( new Song("Tchailkovsky","March of the Toy Soldiers"));
        wrongAnswers.add( new Song("Rosas","Waltz"));
        
    }
  }

}



