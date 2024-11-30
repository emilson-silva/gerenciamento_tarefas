class Task{ 
  final String title;
  final String? description;
  final bool isCompleted;

  Task({
    required this.title,
    this.description,
    this.isCompleted = false,
  });
}