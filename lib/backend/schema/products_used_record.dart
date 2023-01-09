import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_used_record.g.dart';

abstract class ProductsUsedRecord
    implements Built<ProductsUsedRecord, ProductsUsedRecordBuilder> {
  static Serializer<ProductsUsedRecord> get serializer =>
      _$productsUsedRecordSerializer;

  DocumentReference? get name;

  DocumentReference? get brand;

  DocumentReference? get buylink;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsUsedRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProductsUsed');

  static Stream<ProductsUsedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductsUsedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductsUsedRecord._();
  factory ProductsUsedRecord(
          [void Function(ProductsUsedRecordBuilder) updates]) =
      _$ProductsUsedRecord;

  static ProductsUsedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductsUsedRecordData({
  DocumentReference? name,
  DocumentReference? brand,
  DocumentReference? buylink,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsUsedRecord.serializer,
    ProductsUsedRecord(
      (p) => p
        ..name = name
        ..brand = brand
        ..buylink = buylink,
    ),
  );

  return firestoreData;
}
