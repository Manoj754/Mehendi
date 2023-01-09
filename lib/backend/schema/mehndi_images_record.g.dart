// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mehndi_images_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MehndiImagesRecord> _$mehndiImagesRecordSerializer =
    new _$MehndiImagesRecordSerializer();

class _$MehndiImagesRecordSerializer
    implements StructuredSerializer<MehndiImagesRecord> {
  @override
  final Iterable<Type> types = const [MehndiImagesRecord, _$MehndiImagesRecord];
  @override
  final String wireName = 'MehndiImagesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MehndiImagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.slug;
    if (value != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uniqueId;
    if (value != null) {
      result
        ..add('unique_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pics;
    if (value != null) {
      result
        ..add('pics')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ytLinkNew;
    if (value != null) {
      result
        ..add('yt_link_new')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isFav;
    if (value != null) {
      result
        ..add('is_fav')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.likedbyUsers;
    if (value != null) {
      result
        ..add('likedby_users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.picsmultiple;
    if (value != null) {
      result
        ..add('picsmultiple')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.tagslist;
    if (value != null) {
      result
        ..add('tagslist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  MehndiImagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MehndiImagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unique_id':
          result.uniqueId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pics':
          result.pics = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'yt_link_new':
          result.ytLinkNew = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_fav':
          result.isFav = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'likedby_users':
          result.likedbyUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'picsmultiple':
          result.picsmultiple.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'tagslist':
          result.tagslist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$MehndiImagesRecord extends MehndiImagesRecord {
  @override
  final String? slug;
  @override
  final String? uniqueId;
  @override
  final String? pics;
  @override
  final DateTime? createdAt;
  @override
  final String? ytLinkNew;
  @override
  final bool? isFav;
  @override
  final BuiltList<DocumentReference<Object?>>? likedbyUsers;
  @override
  final BuiltList<String>? picsmultiple;
  @override
  final String? name;
  @override
  final BuiltList<String>? tags;
  @override
  final String? tagslist;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MehndiImagesRecord(
          [void Function(MehndiImagesRecordBuilder)? updates]) =>
      (new MehndiImagesRecordBuilder()..update(updates))._build();

  _$MehndiImagesRecord._(
      {this.slug,
      this.uniqueId,
      this.pics,
      this.createdAt,
      this.ytLinkNew,
      this.isFav,
      this.likedbyUsers,
      this.picsmultiple,
      this.name,
      this.tags,
      this.tagslist,
      this.ffRef})
      : super._();

  @override
  MehndiImagesRecord rebuild(
          void Function(MehndiImagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MehndiImagesRecordBuilder toBuilder() =>
      new MehndiImagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MehndiImagesRecord &&
        slug == other.slug &&
        uniqueId == other.uniqueId &&
        pics == other.pics &&
        createdAt == other.createdAt &&
        ytLinkNew == other.ytLinkNew &&
        isFav == other.isFav &&
        likedbyUsers == other.likedbyUsers &&
        picsmultiple == other.picsmultiple &&
        name == other.name &&
        tags == other.tags &&
        tagslist == other.tagslist &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, slug.hashCode),
                                                uniqueId.hashCode),
                                            pics.hashCode),
                                        createdAt.hashCode),
                                    ytLinkNew.hashCode),
                                isFav.hashCode),
                            likedbyUsers.hashCode),
                        picsmultiple.hashCode),
                    name.hashCode),
                tags.hashCode),
            tagslist.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MehndiImagesRecord')
          ..add('slug', slug)
          ..add('uniqueId', uniqueId)
          ..add('pics', pics)
          ..add('createdAt', createdAt)
          ..add('ytLinkNew', ytLinkNew)
          ..add('isFav', isFav)
          ..add('likedbyUsers', likedbyUsers)
          ..add('picsmultiple', picsmultiple)
          ..add('name', name)
          ..add('tags', tags)
          ..add('tagslist', tagslist)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MehndiImagesRecordBuilder
    implements Builder<MehndiImagesRecord, MehndiImagesRecordBuilder> {
  _$MehndiImagesRecord? _$v;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _uniqueId;
  String? get uniqueId => _$this._uniqueId;
  set uniqueId(String? uniqueId) => _$this._uniqueId = uniqueId;

  String? _pics;
  String? get pics => _$this._pics;
  set pics(String? pics) => _$this._pics = pics;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _ytLinkNew;
  String? get ytLinkNew => _$this._ytLinkNew;
  set ytLinkNew(String? ytLinkNew) => _$this._ytLinkNew = ytLinkNew;

  bool? _isFav;
  bool? get isFav => _$this._isFav;
  set isFav(bool? isFav) => _$this._isFav = isFav;

  ListBuilder<DocumentReference<Object?>>? _likedbyUsers;
  ListBuilder<DocumentReference<Object?>> get likedbyUsers =>
      _$this._likedbyUsers ??= new ListBuilder<DocumentReference<Object?>>();
  set likedbyUsers(ListBuilder<DocumentReference<Object?>>? likedbyUsers) =>
      _$this._likedbyUsers = likedbyUsers;

  ListBuilder<String>? _picsmultiple;
  ListBuilder<String> get picsmultiple =>
      _$this._picsmultiple ??= new ListBuilder<String>();
  set picsmultiple(ListBuilder<String>? picsmultiple) =>
      _$this._picsmultiple = picsmultiple;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  String? _tagslist;
  String? get tagslist => _$this._tagslist;
  set tagslist(String? tagslist) => _$this._tagslist = tagslist;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MehndiImagesRecordBuilder() {
    MehndiImagesRecord._initializeBuilder(this);
  }

  MehndiImagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _slug = $v.slug;
      _uniqueId = $v.uniqueId;
      _pics = $v.pics;
      _createdAt = $v.createdAt;
      _ytLinkNew = $v.ytLinkNew;
      _isFav = $v.isFav;
      _likedbyUsers = $v.likedbyUsers?.toBuilder();
      _picsmultiple = $v.picsmultiple?.toBuilder();
      _name = $v.name;
      _tags = $v.tags?.toBuilder();
      _tagslist = $v.tagslist;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MehndiImagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MehndiImagesRecord;
  }

  @override
  void update(void Function(MehndiImagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MehndiImagesRecord build() => _build();

  _$MehndiImagesRecord _build() {
    _$MehndiImagesRecord _$result;
    try {
      _$result = _$v ??
          new _$MehndiImagesRecord._(
              slug: slug,
              uniqueId: uniqueId,
              pics: pics,
              createdAt: createdAt,
              ytLinkNew: ytLinkNew,
              isFav: isFav,
              likedbyUsers: _likedbyUsers?.build(),
              picsmultiple: _picsmultiple?.build(),
              name: name,
              tags: _tags?.build(),
              tagslist: tagslist,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedbyUsers';
        _likedbyUsers?.build();
        _$failedField = 'picsmultiple';
        _picsmultiple?.build();

        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MehndiImagesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
