class ImageModel {
  String? id;
  final String imagePath;
  final int isDeleted;
  final int isMeme;

  ImageModel(
      {this.id, required this.imagePath, this.isMeme = 0, this.isDeleted = 0}) {
    id = imagePath.hashCode.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'isDeleted': isDeleted,
      'isMeme': isMeme
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
        id: map['id'],
        imagePath: map['imagePath'],
        isDeleted: map['isDeleted'],
        isMeme: map['isMeme']);
  }
}
