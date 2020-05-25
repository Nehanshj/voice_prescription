// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorDatabaseData extends DataClass
    implements Insertable<MoorDatabaseData> {
  final int id;
  final String patientDetails;
  final String diagnosis;
  final String prescription;
  final String advice;
  MoorDatabaseData(
      {@required this.id,
      @required this.patientDetails,
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
      patientDetails: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}patient_details']),
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
    if (!nullToAbsent || patientDetails != null) {
      map['patient_details'] = Variable<String>(patientDetails);
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
      patientDetails: patientDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(patientDetails),
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
      patientDetails: serializer.fromJson<String>(json['patientDetails']),
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
      'patientDetails': serializer.toJson<String>(patientDetails),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'prescription': serializer.toJson<String>(prescription),
      'advice': serializer.toJson<String>(advice),
    };
  }

  MoorDatabaseData copyWith(
          {int id,
          String patientDetails,
          String diagnosis,
          String prescription,
          String advice}) =>
      MoorDatabaseData(
        id: id ?? this.id,
        patientDetails: patientDetails ?? this.patientDetails,
        diagnosis: diagnosis ?? this.diagnosis,
        prescription: prescription ?? this.prescription,
        advice: advice ?? this.advice,
      );
  @override
  String toString() {
    return (StringBuffer('MoorDatabaseData(')
          ..write('id: $id, ')
          ..write('patientDetails: $patientDetails, ')
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
          patientDetails.hashCode,
          $mrjc(diagnosis.hashCode,
              $mrjc(prescription.hashCode, advice.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoorDatabaseData &&
          other.id == this.id &&
          other.patientDetails == this.patientDetails &&
          other.diagnosis == this.diagnosis &&
          other.prescription == this.prescription &&
          other.advice == this.advice);
}

class MoorDatabaseCompanion extends UpdateCompanion<MoorDatabaseData> {
  final Value<int> id;
  final Value<String> patientDetails;
  final Value<String> diagnosis;
  final Value<String> prescription;
  final Value<String> advice;
  const MoorDatabaseCompanion({
    this.id = const Value.absent(),
    this.patientDetails = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.prescription = const Value.absent(),
    this.advice = const Value.absent(),
  });
  MoorDatabaseCompanion.insert({
    this.id = const Value.absent(),
    @required String patientDetails,
    @required String diagnosis,
    @required String prescription,
    @required String advice,
  })  : patientDetails = Value(patientDetails),
        diagnosis = Value(diagnosis),
        prescription = Value(prescription),
        advice = Value(advice);
  static Insertable<MoorDatabaseData> custom({
    Expression<int> id,
    Expression<String> patientDetails,
    Expression<String> diagnosis,
    Expression<String> prescription,
    Expression<String> advice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientDetails != null) 'patient_details': patientDetails,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (prescription != null) 'prescription': prescription,
      if (advice != null) 'advice': advice,
    });
  }

  MoorDatabaseCompanion copyWith(
      {Value<int> id,
      Value<String> patientDetails,
      Value<String> diagnosis,
      Value<String> prescription,
      Value<String> advice}) {
    return MoorDatabaseCompanion(
      id: id ?? this.id,
      patientDetails: patientDetails ?? this.patientDetails,
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
    if (patientDetails.present) {
      map['patient_details'] = Variable<String>(patientDetails.value);
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

  final VerificationMeta _patientDetailsMeta =
      const VerificationMeta('patientDetails');
  GeneratedTextColumn _patientDetails;
  @override
  GeneratedTextColumn get patientDetails =>
      _patientDetails ??= _constructPatientDetails();
  GeneratedTextColumn _constructPatientDetails() {
    return GeneratedTextColumn(
      'patient_details',
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
      [id, patientDetails, diagnosis, prescription, advice];
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
    if (data.containsKey('patient_details')) {
      context.handle(
          _patientDetailsMeta,
          patientDetails.isAcceptableOrUnknown(
              data['patient_details'], _patientDetailsMeta));
    } else if (isInserting) {
      context.missing(_patientDetailsMeta);
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
