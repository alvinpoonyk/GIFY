class Failure {

  final String message;
  final String type;

  Failure({required this.type, required this.message});

  @override
  String toString() => this.message;

}