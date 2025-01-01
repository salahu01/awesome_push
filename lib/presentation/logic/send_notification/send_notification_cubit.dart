import 'package:awesome_push/imports.dart';

part 'send_notification_state.dart';
part 'send_notification_cubit.freezed.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  SendNotificationCubit() : super(const SendNotificationState());

  void sendNotification({
    required String projectId,
    required String title,
    required String body,
    required String image,
    required List<String> tokens,
    required String serviceAccountJson,
    required String data,
  }) async {
    emit(state.copyWith(sendNotification: const None()));
    try {
      final res = await sendMessages(
        projectId: projectId,
        title: title,
        body: body,
        image: image,
        tokens: tokens,
        serviceAccountJson: jsonDecode(serviceAccountJson),
        data: data.isNotEmpty ? jsonDecode(data) : null,
      );
      emit(state.copyWith(sendNotification: some(res)));
    } catch (e) {
      emit(state.copyWith(sendNotification: some(left(ApiError(message: e.toString(), statusCode: null)))));
    }
  }
}
