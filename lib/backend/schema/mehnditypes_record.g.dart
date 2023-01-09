// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mehnditypes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MehnditypesRecord> _$mehnditypesRecordSerializer =
    new _$MehnditypesRecordSerializer();

class _$MehnditypesRecordSerializer
    implements StructuredSerializer<MehnditypesRecord> {
  @override
  final Iterable<Type> types = const [MehnditypesRecord, _$MehnditypesRecord];
  @override
  final String wireName = 'MehnditypesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MehnditypesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.relatedimages;
    if (value != null) {
      result
        ..add('relatedimages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nameoftype;
    if (value != null) {
      result
        ..add('nameoftype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tagsoftype;
    if (value != null) {
      result
        ..add('tagsoftype')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MehnditypesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MehnditypesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'relatedimages':
          result.relatedimages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nameoftype':
          result.nameoftype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tagsoftype':
          result.tagsoftype.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MehnditypesRecord extends MehnditypesRecord {
  @override
  final BuiltList<String>? relatedimages;
  @override
  final String? nameoftype;
  @override
  final BuiltList<String>? tagsoftype;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MehnditypesRecord(
          [void Function(MehnditypesRecordBuilder)? updates]) =>
      (new MehnditypesRecordBuilder()..update(updates))._build();

  _$MehnditypesRecord._(
      {this.relatedimages, this.nameoftype, this.tagsoftype, this.ffRef})
      : super._();

  @override
  MehnditypesRecord rebuild(void Function(MehnditypesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MehnditypesRecordBuilder toBuilder() =>
      new MehnditypesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MehnditypesRecord &&
        relatedimages == other.relatedimages &&
        nameoftype == other.nameoftype &&
        tagsoftype == other.tagsoftype &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, relatedimages.hashCode), nameoftype.hashCode),
            tagsoftype.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MehnditypesRecord')
          ..add('relatedimages', relatedimages)
          ..add('nameoftype', nameoftype)
          ..add('tagsoftype', tagsoftype)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MehnditypesRecordBuilder
    implements Builder<MehnditypesRecord, MehnditypesRecordBuilder> {
  _$MehnditypesRecord? _$v;

  ListBuilder<String>? _relatedimages;
  ListBuilder<String> get relatedimages =>
      _$this._relatedimages ??= new ListBuilder<String>();
  set relatedimages(ListBuilder<String>? relatedimages) =>
      _$this._relatedimages = relatedimages;

  String? _nameoftype;
  String? get nameoftype => _$this._nameoftype;
  set nameoftype(String? nameoftype) => _$this._nameoftype = nameoftype;

  ListBuilder<String>? _tagsoftype;
  ListBuilder<String> get tagsoftype =>
      _$this._tagsoftype ??= new ListBuilder<String>();
  set tagsoftype(ListBuilder<String>? tagsoftype) =>
      _$this._tagsoftype = tagsoftype;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MehnditypesRecordBuilder() {
    MehnditypesRecord._initializeBuilder(this);
  }

  MehnditypesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _relatedimages = $v.relatedimages?.toBuilder();
      _nameoftype = $v.nameoftype;
      _tagsoftype = $v.tagsoftype?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MehnditypesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MehnditypesRecord;
  }

  @override
  void update(void Function(MehnditypesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MehnditypesRecord build() => _build();

  _$MehnditypesRecord _build() {
    _$MehnditypesRecord _$result;
    try {
      _$result = _$v ??
          new _$MehnditypesRecord._(
              relatedimages: _relatedimages?.build(),
              nameoftype: nameoftype,
              tagsoftype: _tagsoftype?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'relatedimages';
        _relatedimages?.build();

        _$failedField = 'tagsoftype';
        _tagsoftype?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MehnditypesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
