import '../models/form_question_model.dart';

class FormQuestionController {
  final FormQuestionModel model;
  FormQuestionController(this.model);

  String get option => model.option;
  List<String> get choices => model.choices;

  void setOption(String option) {
    model.setOption(option);
  }

  void addChoice(String choice) {
    model.addChoice(choice);
  }

  void removeChoice(String choice) {
    model.removeChoice(choice);
  }

  
}
