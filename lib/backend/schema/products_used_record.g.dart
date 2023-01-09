// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_used_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsUsedRecord> _$productsUsedRecordSerializer =
    new _$ProductsUsedRecordSerializer();

class _$ProductsUsedRecordSerializer
    implements StructuredSerializer<ProductsUsedRecord> {
  @override
  final Iterable<Type> types = const [ProductsUsedRecord, _$ProductsUsedRecord];
  @override
  final String wireName = 'ProductsUsedRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProductsUsedRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.buylink;
    if (value != null) {
      result
        ..add('buylink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ProductsUsedRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsUsedRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'buylink':
          result.buylink = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ProductsUsedRecord extends ProductsUsedRecord {
  @override
  final DocumentReference<Object?>? name;
  @override
  final DocumentReference<Object?>? brand;
  @override
  final DocumentReference<Object?>? buylink;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductsUsedRecord(
          [void Function(ProductsUsedRecordBuilder)? updates]) =>
      (new ProductsUsedRecordBuilder()..update(updates))._build();

  _$ProductsUsedRecord._({this.name, this.brand, this.buylink, this.ffRef})
      : super._();

  @override
  ProductsUsedRecord rebuild(
          void Function(ProductsUsedRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsUsedRecordBuilder toBuilder() =>
      new ProductsUsedRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsUsedRecord &&
        name == other.name &&
        brand == other.brand &&
        buylink == other.buylink &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), brand.hashCode), buylink.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsUsedRecord')
          ..add('name', name)
          ..add('brand', brand)
          ..add('buylink', buylink)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductsUsedRecordBuilder
    implements Builder<ProductsUsedRecord, ProductsUsedRecordBuilder> {
  _$ProductsUsedRecord? _$v;

  DocumentReference<Object?>? _name;
  DocumentReference<Object?>? get name => _$this._name;
  set name(DocumentReference<Object?>? name) => _$this._name = name;

  DocumentReference<Object?>? _brand;
  DocumentReference<Object?>? get brand => _$this._brand;
  set brand(DocumentReference<Object?>? brand) => _$this._brand = brand;

  DocumentReference<Object?>? _buylink;
  DocumentReference<Object?>? get buylink => _$this._buylink;
  set buylink(DocumentReference<Object?>? buylink) => _$this._buylink = buylink;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductsUsedRecordBuilder() {
    ProductsUsedRecord._initializeBuilder(this);
  }

  ProductsUsedRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _brand = $v.brand;
      _buylink = $v.buylink;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsUsedRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsUsedRecord;
  }

  @override
  void update(void Function(ProductsUsedRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsUsedRecord build() => _build();

  _$ProductsUsedRecord _build() {
    final _$result = _$v ??
        new _$ProductsUsedRecord._(
            name: name, brand: brand, buylink: buylink, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
