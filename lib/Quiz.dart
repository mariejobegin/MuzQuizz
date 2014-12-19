library MuzQuizz;

import 'dart:html';
import 'dart:math' as math;
import 'DataModel/songslist.dart';
import 'dart:async';
import 'dart:js' as js;

Future pause(Duration d) => new Future.delayed(d);

class Quiz {
  
  DataModel gameData;
  Songs currentGameSongs;
  int totalScore;
  bool choiceMade;
  
  Element scoreTimer;
  Element scoreSection;
  
  Quiz()
  {
    gameData = new DataModel();
    
    totalScore = 0;
    scoreTimer = querySelector("#ScoreTimer_id");
    scoreSection = querySelector("#Score_id");
  }
  
  void StartNewQuiz(SongCategory quizCategory, Element categorySection, Element gameSection)
  {
    
    PrepareCurrentGame(quizCategory);
    
    // Section display
    categorySection.hidden = true;
    
    PlaySong(currentGameSongs.list.first);
    
  }
  
  Future PrepareCurrentGame(SongCategory quizCategory)
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
        if (currentSong.wrongAnswers.contains(newSong.fullName) == false && 
            currentSong.fullName != newSong.fullName)
          currentSong.wrongAnswers.add(newSong.fullName);
      }
    }
    
    // Set events on buttons
    for (int i = 1; i <= 4; i++)
    {
      choiceButton = querySelector("#ChoiceNo" + i.toString() +"_id");
      choiceButton.onClick.listen((Event e) async {
 
        await ShowResult(i, currentGameSongs.list.first);
        
        // remove the current song from the list
        currentGameSongs.list.removeAt(0);
        
        if (currentGameSongs.list.length == 0)
          EndGame();
        else
          PlaySong(currentGameSongs.list.first);
      });
    }
    
  }
  
  Future PlaySong(Song song) async
  {
    
    List<int> songsPosition = new List<int>();
    int position, index;
    AudioElement gameAudio = querySelector("#Music_id");
    ButtonElement choiceButton;
        
    while (songsPosition.length < 4)
    {
      position = new math.Random().nextInt(4) + 1;
      if (songsPosition.contains(position) == false)
         songsPosition.add(position);
    }
    
    // Show timer before the songs start
    await ShowTimer();
    
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
    
    choiceMade = false;
    
    // Play the song
    gameAudio.src = song.songPath;
    gameAudio.play(); 
    
    ShowScore();
    
  }
  
  Future EndGame() async
  {
    Element scoreBoardSection = querySelector("#ScoreBoard_id");
    Element totalScoreElement = querySelector("#TotalScore_id");
    Element gameSection = querySelector("#Game_id");
    
    scoreBoardSection.hidden = false;
    gameSection.hidden = true;
    
    totalScoreElement.text = totalScore.toString();
    
    await pause(const Duration(seconds: 5));
    
    window.location.reload();
  }
  
  Future ShowResult(int choiceIndex, Song song) async
  {
    
    ButtonElement choiceButton;
    int goodAnswerIndex;
    
    choiceMade = true;
    
    for (int i = 1; i <= 4; i++)
    {
    
      choiceButton = querySelector("#ChoiceNo" + i.toString() +"_id");
      if (song.fullName == choiceButton.text)
      {
        choiceButton.style.backgroundColor = "green";
        goodAnswerIndex = i;
      }
      else
        choiceButton.style.backgroundColor = "red";
      
    }
    
    // Look if we got the right answer and apply score
    if (choiceIndex == goodAnswerIndex)
      totalScore += int.parse(scoreTimer.text);
    else
      scoreTimer.text = "0";
    
    await pause(const Duration(seconds: 1));
    
    // Restore background color
    for (int i = 1; i <= 4; i++)
    {
      choiceButton = querySelector("#ChoiceNo" + i.toString() +"_id");
      choiceButton.style.backgroundColor = "#35b128";
    }
    
    scoreSection.hidden = true; 
    
  }
  
  
  Future ShowTimer() async
  {
    
    int countdown;
    Element timerSection = querySelector("#Timer_id");
    Element countdownText = querySelector("#Countdown_id");
    Element gameSection = querySelector("#Game_id");
    
    gameSection.hidden = true;
    timerSection.hidden = false;
    
    // Show the timer
    for (int countdown = 3; countdown > 0; countdown--)
    {
      countdownText.text = countdown.toString();
      await pause(const Duration(milliseconds: 750));
    }
    
    gameSection.hidden = false;
    timerSection.hidden = true;

  }
  
  Future ShowScore() async
  {

    scoreSection.hidden = false;
        
    // Show the timer
    for (int countdown = 1000; countdown >= 0 && choiceMade == false; countdown--)
    {
      scoreTimer.text = countdown.toString();
      await pause(const Duration(milliseconds: 10));
    }
    
  }
  
}