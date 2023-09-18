// It is possible to use class keyword to build standard classes,
//standard blueprints/models for standard object d not act as widgets
//This custom class is an object which is a blueprint that contains the qestions text, its possible
//answers as well a utility method for shuffling those answers
//and returning a new list of shuffled answers

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

// This method is helps to create a new list of answers based
//off the original one, as it is importance for us to keep the original list
//of answers unaltered so as to be able to track the correct answers which
//in our case is always the first answer and because we are going to need the
//shuffle method that alters the original value of the list of items it is called on
  List<String> getShuffledAnswers() {
    final shuffledAnswers = [...answers];

    // final shuffledAnswers = List.of(answers);
    // List here is a constructor built into Dart, this is used here to create another copy of list of answers
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
