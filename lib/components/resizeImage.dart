import 'dart:io';
import 'package:image/image.dart' as img;

Future<File> resizeImage(File imageFile) async {
  final image = img.decodeImage(await imageFile.readAsBytes())!;
  final int fixedWidth = 600;
  final aspectRatio = image.width / image.height;
  final newWidth = fixedWidth;
  final newHeight = (newWidth / aspectRatio).toInt();
  final resizedImage =
      img.copyResize(image, width: newWidth, height: newHeight);
  final resizedFile = File(
      '${imageFile.parent.path}/resized_${imageFile.uri.pathSegments.last}');
  return resizedFile.writeAsBytes(img.encodeJpg(resizedImage));
}
