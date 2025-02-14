import 'package:awesome_push/imports.dart';
import 'package:dio/dio.dart';

Future<Either<ApiError, void>> sendMessages({
  required String projectId,
  required String? title,
  required String? body,
  required String? image,
  required List<String> tokens,
  required Map<String, dynamic> serviceAccountJson,
  required dynamic data,
}) async {
  // Generate the Bearer token using service account JSON from assets
  final response = await getBearerTokenFromServiceAccountJson(serviceAccountJson);
  return await response.fold(
    (error) {
      return left(error);
    },
    (firebaseAdminToken) async {
      // Send notifications to all tokens
      try {
        await Dio().post(
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send',
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': '${firebaseAdminToken.type} ${firebaseAdminToken.data}',
            },
          ),
          data: {
            "message": {
              if ((title?.isNotEmpty ?? false) && (body?.isNotEmpty ?? false))
                "notification": {
                  "body": body,
                  "title": title,
                  if (image?.isNotEmpty ?? false) "image": image,
                },
              if (data != null) 'data': data,
              // Handling tokens (single vs multiple)
              if (tokens.length == 1) "token": tokens.first else "tokens": tokens,
              // Android-specific settings
              "android": {
                "priority": "high",
                "notification": {
                  "sound": "notification_sound",
                  "channel_id": "main_channel",
                }
              },
              "apns": {
                "headers": {
                  "apns-priority": "10",
                },
                "payload": {
                  "aps": {
                    "sound": "notification_sound.caf",
                  }
                }
              }
            }
          },
        );
      } on DioException catch (e) {
        print(e.response?.data);
        return left(ApiError(message: e.response?.data.toString() ?? 'Went wrong', statusCode: e.response?.statusCode));
      }

      return right(null);
    },
  );
}
