import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

/// Type of room in an apartment
enum RoomType {
  bedroom,
  bathroom,
  kitchen,
  livingRoom,
  diningRoom,
  study,
  balcony,
  storage,
  laundry,
  other,
}

/// Represents a room within an apartment
@freezed
class Room with _$Room {
  const factory Room({
    required String id,
    required RoomType type,
    required double sizeSquareFeet,
    String? name, // Custom name for the room
    String? description,
    @Default(false) bool hasWindow,
    @Default(false) bool hasBalcony,
    @Default(false) bool hasAttachedBathroom,
    String? notes,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
