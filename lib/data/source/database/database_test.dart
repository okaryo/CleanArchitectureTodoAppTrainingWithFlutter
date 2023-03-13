// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import 'database.dart';
import 'database_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final Database db = DatabaseImpl(
    dbName: 'test',
    inMemory: true,
    logStatements: true,
  );

  group('Todos table tests', () {
    test('Check for existing todos', () async {
      final current = await db.getTodos();

      expect(current.isNotEmpty, true);
    });
  });
}
