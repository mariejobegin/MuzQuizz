import 'package:MuzQuizz/Quiz.dart';
import 'package:MuzQuizz/DataModel/songslist.dart';
import 'dart:html';


void main() {
  
  Quiz quiz = new Quiz();
  
  Element categorySection = querySelector("#Categories_id");
  Element gameSection = querySelector("#Game_id");
  ButtonElement play = querySelector('#Rock_id');
    
  play.onClick.listen((Event e) {
    quiz.StartNewQuiz(SongCategory.ROCK, categorySection, gameSection);
  });

}

/*void reverseText(MouseEvent event) {

  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
  
}*/