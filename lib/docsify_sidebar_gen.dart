import 'dart:io';
import 'package:path/path.dart' as p;

void readDirs() {
  final dir = Directory.current;
  final file = File('_sidebar.md');
  final files = dir.listSync(recursive: true);

  for (final f in files) {
    file.writeAsStringSync('- [${p.basenameWithoutExtension(f.path)}](${p.relative(f.path)})');
  }
}
