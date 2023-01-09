// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.savedimages;
    if (value != null) {
      result
        ..add('savedimages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.profilepic;
    if (value != null) {
      result
        ..add('profilepic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasprofilepic;
    if (value != null) {
      result
        ..add('hasprofilepic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isinfluencer;
    if (value != null) {
      result
        ..add('isinfluencer')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.yThandle;
    if (value != null) {
      result
        ..add('YThandle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.yTLink;
    if (value != null) {
      result
        ..add('YTLink')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'savedimages':
          result.savedimages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'profilepic':
          result.profilepic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasprofilepic':
          result.hasprofilepic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isinfluencer':
          result.isinfluencer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'YThandle':
          result.yThandle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'YTLink':
          result.yTLink = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final BuiltList<String>? savedimages;
  @override
  final String? profilepic;
  @override
  final bool? hasprofilepic;
  @override
  final String? username;
  @override
  final bool? isinfluencer;
  @override
  final String? yThandle;
  @override
  final String? yTLink;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.savedimages,
      this.profilepic,
      this.hasprofilepic,
      this.username,
      this.isinfluencer,
      this.yThandle,
      this.yTLink,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        savedimages == other.savedimages &&
        profilepic == other.profilepic &&
        hasprofilepic == other.hasprofilepic &&
        username == other.username &&
        isinfluencer == other.isinfluencer &&
        yThandle == other.yThandle &&
        yTLink == other.yTLink &&
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, email.hashCode),
                                                        displayName.hashCode),
                                                    photoUrl.hashCode),
                                                uid.hashCode),
                                            createdTime.hashCode),
                                        phoneNumber.hashCode),
                                    savedimages.hashCode),
                                profilepic.hashCode),
                            hasprofilepic.hashCode),
                        username.hashCode),
                    isinfluencer.hashCode),
                yThandle.hashCode),
            yTLink.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('savedimages', savedimages)
          ..add('profilepic', profilepic)
          ..add('hasprofilepic', hasprofilepic)
          ..add('username', username)
          ..add('isinfluencer', isinfluencer)
          ..add('yThandle', yThandle)
          ..add('yTLink', yTLink)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<String>? _savedimages;
  ListBuilder<String> get savedimages =>
      _$this._savedimages ??= new ListBuilder<String>();
  set savedimages(ListBuilder<String>? savedimages) =>
      _$this._savedimages = savedimages;

  String? _profilepic;
  String? get profilepic => _$this._profilepic;
  set profilepic(String? profilepic) => _$this._profilepic = profilepic;

  bool? _hasprofilepic;
  bool? get hasprofilepic => _$this._hasprofilepic;
  set hasprofilepic(bool? hasprofilepic) =>
      _$this._hasprofilepic = hasprofilepic;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  bool? _isinfluencer;
  bool? get isinfluencer => _$this._isinfluencer;
  set isinfluencer(bool? isinfluencer) => _$this._isinfluencer = isinfluencer;

  String? _yThandle;
  String? get yThandle => _$this._yThandle;
  set yThandle(String? yThandle) => _$this._yThandle = yThandle;

  String? _yTLink;
  String? get yTLink => _$this._yTLink;
  set yTLink(String? yTLink) => _$this._yTLink = yTLink;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _savedimages = $v.savedimages?.toBuilder();
      _profilepic = $v.profilepic;
      _hasprofilepic = $v.hasprofilepic;
      _username = $v.username;
      _isinfluencer = $v.isinfluencer;
      _yThandle = $v.yThandle;
      _yTLink = $v.yTLink;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              savedimages: _savedimages?.build(),
              profilepic: profilepic,
              hasprofilepic: hasprofilepic,
              username: username,
              isinfluencer: isinfluencer,
              yThandle: yThandle,
              yTLink: yTLink,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'savedimages';
        _savedimages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
