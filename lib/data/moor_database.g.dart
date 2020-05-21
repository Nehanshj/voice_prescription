// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorDatabaseData extends DataClass
    implements Insertable<MoorDatabaseData> {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String diagnosis;
  final String prescription;
  final String advice;
  MoorDatabaseData(
      {@required this.id,
      @required this.name,
      @required this.age,
      @required this.gender,
      @required this.diagnosis,
      @required this.prescription,
      @required this.advice});
  factory MoorDatabaseData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MoorDatabaseData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      diagnosis: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}diagnosis']),
      prescription: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}prescription']),
      advice:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}advice']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || diagnosis != null) {
      map['diagnosis'] = Variable<String>(diagnosis);
    }
    if (!nullToAbsent || prescription != null) {
      map['prescription'] = Variable<String>(prescription);
    }
    if (!nullToAbsent || advice != null) {
      map['advice'] = Variable<String>(advice);
    }
    return map;
  }

  MoorDatabaseCompanion toCompanion(bool nullToAbsent) {
    return MoorDatabaseCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      diagnosis: diagnosis == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosis),
      prescription: prescription == null && nullToAbsent
          ? const Value.absent()
          : Value(prescription),
      advice:
          advice == null && nullToAbsent ? const Value.absent() : Value(advice),
    );
  }

  factory MoorDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      gender: serializer.fromJson<String>(json['gender']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      prescription: serializer.fromJson<String>(json['prescription']),
      advice: serializer.fromJson<String>(json['advice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'gender': serializer.toJson<String>(gender),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'prescription': serializer.toJson<String>(prescription),
      'advice': serializer.toJson<String>(advice),
    };
  }

  MoorDatabaseData copyWith(
          {int id,
          String name,
          int age,
          String gender,
          String diagnosis,
          String prescription,
          String advice}) =>
      MoorDatabaseData(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        diagnosis: diagnosis ?? this.diagnosis,
        prescription: prescription ?? this.prescription,
        advice: advice ?? this.advice,
      );
  @override
  String toString() {
    return (StringBuffer('MoorDatabaseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('prescription: $prescription, ')
          ..write('advice: $advice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              age.hashCode,
              $mrjc(
                  gender.hashCode,
                  $mrjc(diagnosis.hashCode,
                      $mrjc(prescription.hashCode, advice.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoorDatabaseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.diagnosis == this.diagnosis &&
          other.prescription == this.prescription &&
          other.advice == this.advice);
}

class MoorDatabaseCompanion extends UpdateCompanion<MoorDatabaseData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<String> gender;
  final Value<String> diagnosis;
  final Value<String> prescription;
  final Value<String> advice;
  const MoorDatabaseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.prescription = const Value.absent(),
    this.advice = const Value.absent(),
  });
  MoorDatabaseCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int age,
    @required String gender,
    @required String diagnosis,
    @required String prescription,
    @required String advice,
  })  : name = Value(name),
        age = Value(age),
        gender = Value(gender),
        diagnosis = Value(diagnosis),
        prescription = Value(prescription),
        advice = Value(advice);
  static Insertable<MoorDatabaseData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> age,
    Expression<String> gender,
    Expression<String> diagnosis,
    Expression<String> prescription,
    Expression<String> advice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (prescription != null) 'prescription': prescription,
      if (advice != null) 'advice': advice,
    });
  }

  MoorDatabaseCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> age,
      Value<String> gender,
      Value<String> diagnosis,
      Value<String> prescription,
      Value<String> advice}) {
    return MoorDatabaseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      diagnosis: diagnosis ?? this.diagnosis,
      prescription: prescription ?? this.prescription,
      advice: advice ?? this.advice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (prescription.present) {
      map['prescription'] = Variable<String>(prescription.value);
    }
    if (advice.present) {
      map['advice'] = Variable<String>(advice.value);
    }
    return map;
  }
}

class $MoorDatabaseTable extends MoorDatabase
    with TableInfo<$MoorDatabaseTable, MoorDatabaseData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoorDatabaseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ageMeta = const VerificationMeta('age');
  GeneratedIntColumn _age;
  @override
  GeneratedIntColumn get age => _age ??= _constructAge();
  GeneratedIntColumn _constructAge() {
    return GeneratedIntColumn(
      'age',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _diagnosisMeta = const VerificationMeta('diagnosis');
  GeneratedTextColumn _diagnosis;
  @override
  GeneratedTextColumn get diagnosis => _diagnosis ??= _constructDiagnosis();
  GeneratedTextColumn _constructDiagnosis() {
    return GeneratedTextColumn(
      'diagnosis',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prescriptionMeta =
      const VerificationMeta('prescription');
  GeneratedTextColumn _prescription;
  @override
  GeneratedTextColumn get prescription =>
      _prescription ??= _constructPrescription();
  GeneratedTextColumn _constructPrescription() {
    return GeneratedTextColumn(
      'prescription',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adviceMeta = const VerificationMeta('advice');
  GeneratedTextColumn _advice;
  @override
  GeneratedTextColumn get advice => _advice ??= _constructAdvice();
  GeneratedTextColumn _constructAdvice() {
    return GeneratedTextColumn(
      'advice',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, age, gender, diagnosis, prescription, advice];
  @override
  $MoorDatabaseTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'moor_database';
  @override
  final String actualTableName = 'moor_database';
  @override
  VerificationContext validateIntegrity(Insertable<MoorDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age'], _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('diagnosis')) {
      context.handle(_diagnosisMeta,
          diagnosis.isAcceptableOrUnknown(data['diagnosis'], _diagnosisMeta));
    } else if (isInserting) {
      context.missing(_diagnosisMeta);
    }
    if (data.containsKey('prescription')) {
      context.handle(
          _prescriptionMeta,
          prescription.isAcceptableOrUnknown(
              data['prescription'], _prescriptionMeta));
    } else if (isInserting) {
      context.missing(_prescriptionMeta);
    }
    if (data.containsKey('advice')) {
      context.handle(_adviceMeta,
          advice.isAcceptableOrUnknown(data['advice'], _adviceMeta));
    } else if (isInserting) {
      context.missing(_adviceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorDatabaseData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MoorDatabaseData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoorDatabaseTable createAlias(String alias) {
    return $MoorDatabaseTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoorDatabaseTable _moorDatabase;
  $MoorDatabaseTable get moorDatabase =>
      _moorDatabase ??= $MoorDatabaseTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorDatabase];
}
