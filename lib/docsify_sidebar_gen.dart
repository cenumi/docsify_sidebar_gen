import 'dart:io';
import 'package:path/path.dart' as p;

void readDirs() {
  final dir = Directory.current;
  final file = File('_sidebar.md');
  final files = dir.listSync(recursive: true);

  var sb = StringBuffer();
  for (final f in files) {
    if (p.extension(f.path) == '.md' && p.basename(f.path) != '_sidebar.md') {
      sb.writeln('- [${p.basenameWithoutExtension(f.path).trim()}](${p.relative(f.path)})');
    }
  }
  file.writeAsStringSync(sb.toString());
}
