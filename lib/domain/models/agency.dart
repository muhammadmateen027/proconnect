import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency.freezed.dart';
part 'agency.g.dart';

@freezed
class Agency with _$Agency {
  const factory Agency({
    required String id,
    required String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  }) = _Agency;

  factory Agency.fromJson(Map<String, dynamic> json) => _$AgencyFromJson(json);
}
