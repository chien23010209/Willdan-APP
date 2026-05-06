class Skill {
  final int id;
  final String name;
  final String description;
  final List<String> steps; // Phải là List<String> vì dữ liệu của bạn có dấu [ ]
  final String imagePath;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.steps,
    required this.imagePath,
  });
}