

import 'dart:convert';

class QuizModels {
  String? id;String? courseId;String? sectionId;String? title;
  String? slug;String? text;String? itemType;String? createdAt;
  QuizInfoModels? options; List<QuizQuestionsModels>? questions;
  bool? isCompleted;bool? quizGradable;

  QuizModels({this.id,this.courseId,this.sectionId,this.title,this.slug,this.text,
  this.itemType, this.options,this.quizGradable,this.createdAt,this.isCompleted,this.questions
  });

  factory QuizModels.fromJSON(Map map) {
    return QuizModels(
      id:map['id'].toString(),
      courseId: map['course_id'].toString(),
      sectionId: map['section_id'].toString(),
      title: map['title']['ar'] != null ? map['title']['ar'].toString() : '',
      slug:map['slug'].toString(),
      text:map['text']['ar'] != null ? map['text']['ar'].toString() : '',
      itemType: map['item_type'] ?? '',
      options: map['options'] != null ? QuizInfoModels.fromJSON(json.decode(map['options'])) : null,
      quizGradable: map['quiz_gradable'] != null ? map['quiz_gradable'] == 1 ? true : false : false,
      createdAt:map['created_at'] != null  ? map['questions_limit'].toString() : '',
      isCompleted: map['is_completed'] == false || map['is_completed'] == null ? false : true,
      questions:map['questions'] != []  ? (map['questions'] as List) .map((e) => QuizQuestionsModels.fromJSON(e)).toList() : [],
    );
  }
}

class QuizQuestionsModels {
  String? id; String? quizId; String? title; String? type;
  String? score;List<QuizAnswersModels>? answers;
  bool? isRadio;bool? isCheckbox;bool? isText;bool? isTextarea;

  QuizQuestionsModels({ this.id,this.quizId,this.title,this.type,this.score,this.answers,
    this.isCheckbox,this.isRadio,this.isText,this.isTextarea});

  factory QuizQuestionsModels.fromJSON(Map map) {
    return QuizQuestionsModels(
      id:map['id'].toString(),
      quizId: map['quiz_id'].toString(),
      title: map['title'].toString(),
      type: map['type'].toString(),
      isRadio: map['type'] == 'radio' ? true : false,
      isCheckbox: map['type'] == 'checkbox' ? true : false,
      isText: map['type'] == 'text' ? true : false,
      isTextarea: map['type'] == 'textarea' ? true : false,
      score: map['score'].toString(),
      answers: map['options'] != [] ? (map['options'] as List) .map((e) => QuizAnswersModels.fromJSON(e)).toList() : [],
    );
  }
}

class QuizAnswersModels {
  String? id;
  String? questionId;
  String? title;
  bool? isCorrect;
  QuizAnswersModels({ this.id,this.questionId,this.isCorrect,this.title });

  factory QuizAnswersModels.fromJSON(Map map) {
    return QuizAnswersModels(
      id:map['id'].toString(),
      title:map['title'].toString(),
      questionId: map['question_id'].toString(),
      isCorrect: map['is_correct'] != null ? map['is_correct'] == 1 ? true : false : false,
    );
  }
}

class QuizInfoModels {
  String? questionsLimit;
  String? passingScore;
  String? timeLimit;
  bool? showTime;
  QuizInfoModels({ this.questionsLimit, this.passingScore,this.timeLimit ,this.showTime});

  factory QuizInfoModels.fromJSON(Map map) {
    return QuizInfoModels(
      questionsLimit:map['questions_limit'] != null  ? map['questions_limit'].toString() : '',
      passingScore: map['passing_score'] != null  ? map['passing_score'].toString() : '',
      timeLimit: map['time_limit'] != null  ? map['time_limit'].toString() : '',
      showTime: map['show_time'] != null ? map['show_time'] == "1" ? true : false : false,
    );
  }
}
