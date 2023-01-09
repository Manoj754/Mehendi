import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mehndi_images_record.g.dart';

abstract class MehndiImagesRecord
    implements Built<MehndiImagesRecord, MehndiImagesRecordBuilder> {
  static Serializer<MehndiImagesRecord> get serializer =>
      _$mehndiImagesRecordSerializer;

  String? get slug;

  @BuiltValueField(wireName: 'unique_id')
  String? get uniqueId;

  String? get pics;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'yt_link_new')
  String? get ytLinkNew;

  @BuiltValueField(wireName: 'is_fav')
  bool? get isFav;

  @BuiltValueField(wireName: 'likedby_users')
  BuiltList<DocumentReference>? get likedbyUsers;

  BuiltList<String>? get picsmultiple;

  String? get name;

  BuiltList<String>? get tags;

  String? get tagslist;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MehndiImagesRecordBuilder builder) => builder
    ..slug = ''
    ..uniqueId = ''
    ..pics = ''
    ..ytLinkNew = ''
    ..isFav = false
    ..likedbyUsers = ListBuilder()
    ..picsmultiple = ListBuilder()
    ..name = ''
    ..tags = ListBuilder()
    ..tagslist = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mehndi_images');

  static Stream<MehndiImagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MehndiImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static MehndiImagesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MehndiImagesRecord(
        (c) => c
          ..slug = snapshot.data['slug']
          ..uniqueId = snapshot.data['unique_id']
          ..pics = snapshot.data['pics']
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..ytLinkNew = snapshot.data['yt_link_new']
          ..isFav = snapshot.data['is_fav']
          ..likedbyUsers = safeGet(() =>
              ListBuilder(snapshot.data['likedby_users'].map((s) => toRef(s))))
          ..picsmultiple =
              safeGet(() => ListBuilder(snapshot.data['picsmultiple']))
          ..name = snapshot.data['name']
          ..tags = safeGet(() => ListBuilder(snapshot.data['tags']))
          ..tagslist = snapshot.data['tagslist']
          ..ffRef = MehndiImagesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MehndiImagesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'mehndi_images',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  MehndiImagesRecord._();
  factory MehndiImagesRecord(
          [void Function(MehndiImagesRecordBuilder) updates]) =
      _$MehndiImagesRecord;

  static MehndiImagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMehndiImagesRecordData({
  String? slug,
  String? uniqueId,
  String? pics,
  DateTime? createdAt,
  String? ytLinkNew,
  bool? isFav,
  String? name,
  String? tagslist,
}) {
  final firestoreData = serializers.toFirestore(
    MehndiImagesRecord.serializer,
    MehndiImagesRecord(
      (m) => m
        ..slug = slug
        ..uniqueId = uniqueId
        ..pics = pics
        ..createdAt = createdAt
        ..ytLinkNew = ytLinkNew
        ..isFav = isFav
        ..likedbyUsers = null
        ..picsmultiple = null
        ..name = name
        ..tags = null
        ..tagslist = tagslist,
    ),
  );

  return firestoreData;
}
