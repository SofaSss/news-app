// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_articles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserArticlesModel _$UserArticlesModelFromJson(Map<String, dynamic> json) {
  return _UserArticlesModel.fromJson(json);
}

/// @nodoc
mixin _$UserArticlesModel {
  int get id => throw _privateConstructorUsedError;
  int get user => throw _privateConstructorUsedError;
  int get article_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserArticlesModelCopyWith<UserArticlesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserArticlesModelCopyWith<$Res> {
  factory $UserArticlesModelCopyWith(
          UserArticlesModel value, $Res Function(UserArticlesModel) then) =
      _$UserArticlesModelCopyWithImpl<$Res, UserArticlesModel>;
  @useResult
  $Res call({int id, int user, int article_id});
}

/// @nodoc
class _$UserArticlesModelCopyWithImpl<$Res, $Val extends UserArticlesModel>
    implements $UserArticlesModelCopyWith<$Res> {
  _$UserArticlesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? article_id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      article_id: null == article_id
          ? _value.article_id
          : article_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserArticlesModelImplCopyWith<$Res>
    implements $UserArticlesModelCopyWith<$Res> {
  factory _$$UserArticlesModelImplCopyWith(_$UserArticlesModelImpl value,
          $Res Function(_$UserArticlesModelImpl) then) =
      __$$UserArticlesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int user, int article_id});
}

/// @nodoc
class __$$UserArticlesModelImplCopyWithImpl<$Res>
    extends _$UserArticlesModelCopyWithImpl<$Res, _$UserArticlesModelImpl>
    implements _$$UserArticlesModelImplCopyWith<$Res> {
  __$$UserArticlesModelImplCopyWithImpl(_$UserArticlesModelImpl _value,
      $Res Function(_$UserArticlesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? article_id = null,
  }) {
    return _then(_$UserArticlesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      article_id: null == article_id
          ? _value.article_id
          : article_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserArticlesModelImpl implements _UserArticlesModel {
  const _$UserArticlesModelImpl(
      {required this.id, required this.user, required this.article_id});

  factory _$UserArticlesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserArticlesModelImplFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int article_id;

  @override
  String toString() {
    return 'UserArticlesModel(id: $id, user: $user, article_id: $article_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserArticlesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.article_id, article_id) ||
                other.article_id == article_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, article_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserArticlesModelImplCopyWith<_$UserArticlesModelImpl> get copyWith =>
      __$$UserArticlesModelImplCopyWithImpl<_$UserArticlesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserArticlesModelImplToJson(
      this,
    );
  }
}

abstract class _UserArticlesModel implements UserArticlesModel {
  const factory _UserArticlesModel(
      {required final int id,
      required final int user,
      required final int article_id}) = _$UserArticlesModelImpl;

  factory _UserArticlesModel.fromJson(Map<String, dynamic> json) =
      _$UserArticlesModelImpl.fromJson;

  @override
  int get id;
  @override
  int get user;
  @override
  int get article_id;
  @override
  @JsonKey(ignore: true)
  _$$UserArticlesModelImplCopyWith<_$UserArticlesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
