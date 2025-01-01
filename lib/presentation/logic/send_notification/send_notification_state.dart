part of 'send_notification_cubit.dart';

@freezed
class SendNotificationState with _$SendNotificationState {
  const factory SendNotificationState({
   Option<Either<ApiError, void>>? sendNotification,
  }) = _SendNotificationState;
}
