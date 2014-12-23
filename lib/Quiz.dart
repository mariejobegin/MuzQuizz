library MuzQuizz;

import 'dart:html';
import 'dart:math' as math;
import 'DataModel/songslist.dart';
import 'dart:async';
import 'dart:js' as js;

Future pause(Duration d) => new Future.delayed(d);

// This is the main class that will handle all the web interface interaction
class Quiz {
  
  // Constants declaration
  static final String DEFAULT_COLOR = "#919491";
  static final int NUMBER_SONGS_PER_GAME = 5;
  
  // Useful variables
  DataModel gameData;
  Songs currentGameSongs;
  bool choiceMade;
  
  // Audio elements
  AudioElement gameAudio;
  
  // Score variables
  int totalScore;
  int goodAnswersCounter;
  
  // Score elements
  Element scoreTimer;
  Element scoreSection;
  Element goodAnswers;
  Element currentScore;
  
  
  // Initialize the class variables
  Quiz()
  {
    gameData = new DataModel();
    
    gameAudio = querySelector("#Music_id");
    
    totalScore = 0;
    goodAnswersCounter = 0;
    
    scoreTimer = querySelector("#ScoreTimer_id");
    scoreSection = querySelector("#Score_id");
    goodAnswers = querySelector("#GoodAnswers_id");
    currentScore = querySelector("#CurrentScore_id");
    
    goodAnswers.text = goodAnswersCounter.toString() + "/" + NUMBER_SONGS_PER_GAME.toString();
    
  }
  
  // Set the game and start to play the first song
  void StartNewQuiz(SongCategory quizCategory, Element categorySection)
  {
    
    BodyElement bodySection = querySelector("#Body_id");
    
    PrepareCurrentGame(quizCategory);
    
    // Section display
    categorySection.hidden = true;
    scoreSection.hidden = false;
    
    PlaySong(currentGameSongs.list.first);
    
  }
  
  // Set the current games by selecting the songs that are going to be played and
  // create events that will be needed to receive answers from player
  Future PrepareCurrentGame(SongCategory quizCategory)
  {
    Element categoryTitle;
    ButtonElement choiceButton;
    Song newSong;
    
    categoryTitle = querySelector("#CategoryTitle_id");
    
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
        newSong = gameData.wrongAnswers.randomSong();
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
    
    // Set the song category title
    switch (quizCategory) {
      case SongCategory.ROCK:
        categoryTitle.text = "Rock songs";
        break;
      case SongCategory.CLASSIC:
        categoryTitle.text = "Classic songs";
        categoryTitle.style.left = "190px";
    }
    
    
  }
  
  // Do everything to play the current song and have the player guess
  Future PlaySong(Song song) async
  {
    
    List<int> songsPosition = new List<int>();
    int position, index;
    ButtonElement choiceButton;
    
    // Set the random position that the correct and wrong answers will be showed
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
  
  // Show the score board before resetting the game
  Future EndGame() async
  {
    
    Element scoreBoardSection = querySelector("#ScoreBoard_id");
    Element totalScoreElement = querySelector("#TotalScore_id");
    Element gameSection = querySelector("#Game_id");
    Element answersResult = querySelector("#AnswersResult_id");
    
    scoreBoardSection.hidden = false;
    gameSection.hidden = true;
    scoreSection.hidden = true;
    
    totalScoreElement.text = totalScore.toString();
    
    answersResult.text = "You have " + goodAnswersCounter.toString() + " good answers on " + NUMBER_SONGS_PER_GAME.toString();
    
    await pause(const Duration(seconds: 6));
    
    window.location.reload();
  }
  
  // Evaluate the player choice, give points and show the answers
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
    if (choiceIndex == goodAnswerIndex) {
      totalScore += int.parse(scoreTimer.text);
      goodAnswersCounter += 1;
      gameAudio.src = "packages/MuzQuizz/Sounds/General/Right-sound.ogg";
    }
    else {
      scoreTimer.text = "0";
      gameAudio.src = "packages/MuzQuizz/Sounds/General/Fail-sound.ogg";
    }
    
    gameAudio.play(); 
    
    // Update score
    goodAnswers.text = goodAnswersCounter.toString() + "/" + NUMBER_SONGS_PER_GAME.toString();
    currentScore.text = totalScore.toString();
    
    await pause(const Duration(milliseconds: 1500));
    
    // Restore background color
    for (int i = 1; i <= 4; i++)
    {
      choiceButton = querySelector("#ChoiceNo" + i.toString() +"_id");
      choiceButton.style.backgroundColor = DEFAULT_COLOR;
    }
    
  }
  
  // Show a timer before the song starts
  Future ShowTimer() async
  {
    
    int countdown;
    Element timerSection = querySelector("#Timer_id");
    Element countdownText = querySelector("#Countdown_id");
    Element gameSection = querySelector("#Game_id");
    
    gameSection.hidden = true;
    timerSection.hidden = false;
    scoreTimer.hidden = true;
    
    // Show the timer
    for (int countdown = 3; countdown > 0; countdown--)
    {
      countdownText.text = countdown.toString();
      await pause(const Duration(milliseconds: 1000));
    }
    
    gameSection.hidden = false;
    timerSection.hidden = true;
    scoreTimer.hidden = false;

  }
  
  // Show the running score for the current song
  Future ShowScore() async
  {

    scoreTimer.hidden = false;
        
    // Show the timer
    for (int countdown = 1000; countdown >= 0 && choiceMade == false; countdown--)
    {
      scoreTimer.text = countdown.toString();
      await pause(const Duration(milliseconds: 10));
    }
    
  }
  
}