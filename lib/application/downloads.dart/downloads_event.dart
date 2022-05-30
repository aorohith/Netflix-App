import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'downloads_event.freezed.dart';

@freezed
class DownloadsEvent with _$DownloadsEvent{
  const factory DownloadsEvent.getDownloadsImage() = _GetDownloadsImage;
}
