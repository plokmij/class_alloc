class Classroom {
  final int id;
  final String name;
  final int size;
  final Layout layout;

  Classroom({
    required this.id,
    required this.name,
    required this.size,
    required this.layout,
  });
}

enum Layout {
  conference('conference'),
  classroom('classroom');

  final String name;

  const Layout(this.name);

  factory Layout.fromName(String name) {
    switch (name) {
      case 'conference':
        return Layout.conference;
      case 'classroom':
        return Layout.classroom;
      default:
        throw ArgumentError('Invalid layout name: $name');
    }
  }
}
