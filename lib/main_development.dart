import 'package:proconnect/app/app.dart';
import 'package:proconnect/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
