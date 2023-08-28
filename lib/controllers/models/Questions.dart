class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "It is very necessary to learn Dart language for building Flutter application?",
    "options": ['Yes', 'No', 'Can be yes or no', ' Can not say'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Flutter developed by?.",
    "options": ['Oracle', 'Facebook', 'Google', ' IBM'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Flutter is not a language; it is an SDK.",
    "options": ['TRUE', 'FALSE', ' Can be true or false', 'Can not say'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "The first alpha version of Flutter was released in ?",
    "options": ['2016', '2017', '2018', '2019'],
    "answer_index": 2,
  },
   {
    "id": 5,
    "question": "Flutter is mainly optimized for 2D mobile apps that can run on?",
    "options": ['Android', 'iOS', 'Both A and B', 'None of the above'],
    "answer_index": 3,
  },
];