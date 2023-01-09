import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mehnditypes_record.g.dart';

abstract class MehnditypesRecord
    implements Built<MehnditypesRecord, MehnditypesRecordBuilder> {
  static Serializer<MehnditypesRecord> get serializer =>
      _$mehnditypesRecordSerializer;

  BuiltList<String>? get relatedimages;

  String? get nameoftype;

  BuiltList<String>? get tagsoftype;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MehnditypesRecordBuilder builder) => builder
    ..relatedimages = ListBuilder()
    ..nameoftype = ''
    ..tagsoftype = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mehnditypes');

  static Stream<MehnditypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MehnditypesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MehnditypesRecord._();
  factory MehnditypesRecord([void Function(MehnditypesRecordBuilder) updates]) =
      _$MehnditypesRecord;

  static MehnditypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMehnditypesRecordData({
  String? nameoftype,
}) {
  final firestoreData = serializers.toFirestore(
    MehnditypesRecord.serializer,
    MehnditypesRecord(
      (m) => m
        ..relatedimages = null
        ..nameoftype = nameoftype
        ..tagsoftype = null,
    ),
  );

  return firestoreData;
}
