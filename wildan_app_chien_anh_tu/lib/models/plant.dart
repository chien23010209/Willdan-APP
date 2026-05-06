class Plant {
  final int id;
  final String name;
  final String toxicity;
  final String description;
  final String usage;
  final String imagePath; // Thêm dòng này

  Plant({
    required this.id, 
    required this.name, 
    required this.toxicity, 
    required this.description, 
    required this.usage,
    required this.imagePath, // Thêm dòng này
  });
}