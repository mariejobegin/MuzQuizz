library MuzQuizz;

import 'dart:html';
import 'dart:math' as math;
import 'DataModel/songslist.dart';

class Quiz {
  
  DataModel gameData;
  Songs currentGameSongs;
  
  Quiz()
  {
    gameData = new DataModel();
  }
  
  void StartNewQuiz(SongCategory quizCategory, Element categorySection, Element gameSection)
  {
    
    PrepareCurrentGame(quizCategory);
    
    // Section display
    categorySection.hidden = true;
    gameSection.hidden = false;
    
    PlaySong(currentGameSongs.list.first);
    
  }
  
  void PrepareCurrentGame(SongCategory quizCategory)
  {
    
    ButtonElement choiceButton;
    Song newSong;
    currentGameSongs = new Songs();
    
    gameData.init(quizCategory);
    
    // Build the song list (random) that will be played for this game
    while (currentGameSongs.count < 5)
    {
      newSong = gameData.songs.randomSong();
      if (currentGameSongs.find(newSong.songName) == null)
        currentGameSongs.add(newSong);
    }
    
    // Add wrong answers to each songs
    for (Song currentSong in currentGameSongs)
    {
      while (currentSong.wrongAnswers.length < 3)
      {
        newSong = gameData.songs.randomSong();
        if (currentSong.wrongAnswers.contains(newSong.fullName) == false && currentSong.fullName != newSong.fullName)
          currentSong.wrongAnswers.add(newSong.fullName);
      }
    }
    
    // Set events on buttons
    for (int i = 1; i <= 4; i++)
    {
      choiceButton = querySelector("#ChoiceNo" + i.toString() +"_id");
      choiceButton.onClick.listen((Event e) {
        
        ShowResult();
        
        if (currentGameSongs.list.length == 0)
          EndGame();
        else
          PlaySong(currentGameSongs.list.first);
      });
    }
    
  }
  
  void PlaySong(Song song)
  {
    
    List<int> songsPosition = new List<int>();
    int position, index;
    AudioElement gameAudio = querySelector("#Music_id");
    ButtonElement choiceButton;
    
    // remove the current song from the list
    currentGameSongs.list.removeAt(0);
    
    while (songsPosition.length < 4)
    {
      position = new math.Random().nextInt(4) + 1;
      if (songsPosition.contains(position) == false)
         songsPosition.add(position);
    }
    
    // Show timer before the songs start
    ShowTimer();
    
    // Set the good answer
    choiceButton = querySelector("#ChoiceNo" + songsPosition[0].toString() +"_id");
    choiceButton.text = song.fullName;
    songsPosition.removeAt(0);
    
    // Set the wrong answers
    index = 0;
    for (position in songsPosition)
    {
      
      choiceButton = querySelector("#ChoiceNo" + position.toString() +"_id");
      choiceButton.text = song.wrongAnswers[index];
      
      index++;
      
    }
    
    // Play the song
    gameAudio.src = song.songPath;
    gameAudio.play(); 
    
  }
  
  void EndGame()
  {
    window.location.reload();
  }
  
  void ShowResult()
  {
    // TODO: Placeholder for now.
  }
  
  void ShowTimer()
  {
// TODO: Placeholder for now.
  }
  
}