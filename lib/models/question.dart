// lib/models/question.dart

class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String category;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.category,
  });

  String get correctAnswer => options[correctIndex];
}

class QuizModule {
  final String id;
  final String title;
  final String subtitle;
  final String level;
  final String color;
  final String icon;
  final List<Question> questions;

  const QuizModule({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.level,
    required this.color,
    required this.icon,
    required this.questions,
  });
}

class QuizResult {
  final String moduleId;
  final String moduleTitle;
  final int totalQuestions;
  final int correctAnswers;
  final DateTime completedAt;
  final List<QuestionResult> questionResults;

  const QuizResult({
    required this.moduleId,
    required this.moduleTitle,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.completedAt,
    required this.questionResults,
  });

  double get percentage => (correctAnswers / totalQuestions) * 100;

  String get grade {
    if (percentage >= 90) return 'Excellent';
    if (percentage >= 75) return 'Bien';
    if (percentage >= 60) return 'Passable';
    return 'À revoir';
  }

  String get gradeEmoji {
    if (percentage >= 90) return '🏆';
    if (percentage >= 75) return '⭐';
    if (percentage >= 60) return '👍';
    return '📚';
  }
}

class QuestionResult {
  final Question question;
  final int selectedIndex;
  final bool isCorrect;

  const QuestionResult({
    required this.question,
    required this.selectedIndex,
    required this.isCorrect,
  });
}
