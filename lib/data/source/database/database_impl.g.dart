// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
class Todos extends Table with TableInfo<Todos, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Todos(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  late final GeneratedColumn<int> isCompleted = GeneratedColumn<int>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
      'due_date', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, isCompleted, dueDate];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_completed'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}due_date'])!,
    );
  }

  @override
  Todos createAlias(String alias) {
    return Todos(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String? description;
  final int isCompleted;
  final String dueDate;
  const Todo(
      {required this.id,
      required this.title,
      this.description,
      required this.isCompleted,
      required this.dueDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_completed'] = Variable<int>(isCompleted);
    map['due_date'] = Variable<String>(dueDate);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCompleted: Value(isCompleted),
      dueDate: Value(dueDate),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      isCompleted: serializer.fromJson<int>(json['is_completed']),
      dueDate: serializer.fromJson<String>(json['due_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'is_completed': serializer.toJson<int>(isCompleted),
      'due_date': serializer.toJson<String>(dueDate),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          int? isCompleted,
          String? dueDate}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        dueDate: dueDate ?? this.dueDate,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, isCompleted, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.dueDate == this.dueDate);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> isCompleted;
  final Value<String> dueDate;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int isCompleted,
    required String dueDate,
  })  : title = Value(title),
        isCompleted = Value(isCompleted),
        dueDate = Value(dueDate);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? isCompleted,
    Expression<String>? dueDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dueDate != null) 'due_date': dueDate,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? isCompleted,
      Value<String>? dueDate}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<int>(isCompleted.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(dueDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }
}

class TodosEntries extends Table
    with
        TableInfo<TodosEntries, TodosEntrie>,
        VirtualTableInfo<TodosEntries, TodosEntrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TodosEntries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [title, description];
  @override
  String get aliasedName => _alias ?? 'todos_entries';
  @override
  String get actualTableName => 'todos_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TodosEntrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TodosEntrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodosEntrie(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  TodosEntries createAlias(String alias) {
    return TodosEntries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(title, description, content=todos, content_rowid=id)';
}

class TodosEntrie extends DataClass implements Insertable<TodosEntrie> {
  final String title;
  final String description;
  const TodosEntrie({required this.title, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    return map;
  }

  TodosEntriesCompanion toCompanion(bool nullToAbsent) {
    return TodosEntriesCompanion(
      title: Value(title),
      description: Value(description),
    );
  }

  factory TodosEntrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodosEntrie(
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
    };
  }

  TodosEntrie copyWith({String? title, String? description}) => TodosEntrie(
        title: title ?? this.title,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('TodosEntrie(')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodosEntrie &&
          other.title == this.title &&
          other.description == this.description);
}

class TodosEntriesCompanion extends UpdateCompanion<TodosEntrie> {
  final Value<String> title;
  final Value<String> description;
  const TodosEntriesCompanion({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });
  TodosEntriesCompanion.insert({
    required String title,
    required String description,
  })  : title = Value(title),
        description = Value(description);
  static Insertable<TodosEntrie> custom({
    Expression<String>? title,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    });
  }

  TodosEntriesCompanion copyWith(
      {Value<String>? title, Value<String>? description}) {
    return TodosEntriesCompanion(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosEntriesCompanion(')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  _$DatabaseImpl.connect(DatabaseConnection c) : super.connect(c);
  late final Todos todos = Todos(this);
  late final Index todosDueDateIdx = Index('todos_due_date_idx',
      'CREATE INDEX IF NOT EXISTS todos_due_date_idx ON todos (due_date)');
  late final TodosEntries todosEntries = TodosEntries(this);
  late final Trigger todosInsert = Trigger(
      'CREATE TRIGGER todos_insert AFTER INSERT ON todos BEGIN INSERT INTO todos_entries ("rowid", title, description) VALUES (new.id, new.title, new.description);END',
      'todos_insert');
  late final Trigger todosDelete = Trigger(
      'CREATE TRIGGER todos_delete AFTER DELETE ON todos BEGIN INSERT INTO todos_entries (todos_entries, "rowid", title, description) VALUES (\'delete\', old.id, old.title, old.description);END',
      'todos_delete');
  late final Trigger todosUpdate = Trigger(
      'CREATE TRIGGER todos_update AFTER UPDATE ON todos BEGIN INSERT INTO todos_entries (todos_entries, "rowid", title, description) VALUES (\'delete\', new.id, new.title, new.description);INSERT INTO todos_entries ("rowid", title, description) VALUES (new.id, new.title, new.description);END',
      'todos_update');
  Selectable<SearchTodosResult> _searchTodos(String query) {
    return customSelect(
        'SELECT"result"."id" AS "nested_0.id", "result"."title" AS "nested_0.title", "result"."description" AS "nested_0.description", "result"."is_completed" AS "nested_0.is_completed", "result"."due_date" AS "nested_0.due_date" FROM todos_entries INNER JOIN todos AS result ON result.id = todos_entries."rowid" WHERE todos_entries MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          todosEntries,
          todos,
        }).asyncMap((QueryRow row) async {
      return SearchTodosResult(
        result: await todos.mapFromRow(row, tablePrefix: 'nested_0'),
      );
    });
  }

  Selectable<Todo> _getTodos() {
    return customSelect('SELECT * FROM todos', variables: [], readsFrom: {
      todos,
    }).asyncMap(todos.mapFromRow);
  }

  Selectable<Todo> _getTodoById(int id) {
    return customSelect('SELECT * FROM todos WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          todos,
        }).asyncMap(todos.mapFromRow);
  }

  Selectable<Todo> _getTodosByDate(String dueDate) {
    return customSelect('SELECT * FROM todos WHERE due_date = ?1', variables: [
      Variable<String>(dueDate)
    ], readsFrom: {
      todos,
    }).asyncMap(todos.mapFromRow);
  }

  Future<int> _insertTodo(
      String title, String? description, int isCompleted, String dueDate) {
    return customInsert(
      'INSERT INTO todos (title, description, is_completed, due_date) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(title),
        Variable<String>(description),
        Variable<int>(isCompleted),
        Variable<String>(dueDate)
      ],
      updates: {todos},
    );
  }

  Future<int> _updateTodo(String title, String? description, int isCompleted,
      String dueDate, int id) {
    return customUpdate(
      'UPDATE todos SET title = ?1, description = ?2, is_completed = ?3, due_date = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(title),
        Variable<String>(description),
        Variable<int>(isCompleted),
        Variable<String>(dueDate),
        Variable<int>(id)
      ],
      updates: {todos},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteTodo(int id) {
    return customUpdate(
      'DELETE FROM todos WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {todos},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _deleteCompletedTodos() {
    return customUpdate(
      'DELETE FROM todos WHERE is_completed = 1',
      variables: [],
      updates: {todos},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _deleteAllTodos() {
    return customUpdate(
      'DELETE FROM todos',
      variables: [],
      updates: {todos},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        todos,
        todosDueDateIdx,
        todosEntries,
        todosInsert,
        todosDelete,
        todosUpdate
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('todos',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('todos_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todos',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('todos_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todos',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('todos_entries', kind: UpdateKind.insert),
            ],
          ),
        ],
      );
}

class SearchTodosResult {
  final Todo result;
  SearchTodosResult({
    required this.result,
  });
}
