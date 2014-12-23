import 'package:MuzQuizz/Quiz.dart';
import 'package:MuzQuizz/DataModel/songslist.dart';
import 'dart:html';

void main() {
  
  Quiz quiz = new Quiz();
  
  Element categorySection = querySelector("#Categories_id");
  ButtonElement RockButton = querySelector('#Rock_id');
  ButtonElement classicButton = querySelector('#Classic_id');
  
  // Check if the rock button is pressed and start the game
  RockButton.onClick.listen((Event e) {
    quiz.StartNewQuiz(SongCategory.ROCK, categorySection);
  });
  
  // Check if the classic button is presset and start the game
  classicButton.onClick.listen((Event e) {
    quiz.StartNewQuiz(SongCategory.CLASSIC, categorySection);
  });

}