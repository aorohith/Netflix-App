import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

@freezed
class DownloadsState with _$DownloadsState{
  const factory DownloadsState({
    required bool isLoding,
    List<Downloads>? downloads,
  }) = _DownloadsState;
  factory DownloadsState.initial() {
    return const DownloadsState(isLoding: false);
  }
}


//     return const DownloadsState(isLoding: false);
//   }
// @freezed
// class DownloadsState with _$DownloadsState {
//   const factory DownloadsState({
//     required bool isLoding,
//     List<Downloads>? downloads,
//   }) = _DownloadsState;

//   factory DownloadsState.initial() {
//     return const DownloadsState(isLoding: false);
//   }
// }
