// Create a Bearer token using service account credentials
import 'package:awesome_push/imports.dart';

Future<Either<ApiError, AccessToken>> getBearerTokenFromServiceAccountJson(
  Map<String, dynamic> serviceAccountJson,
) async {
  try {
    // Define the required Firebase scope
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    // Load service account credentials
    final accountCredentials = ServiceAccountCredentials.fromJson(serviceAccountJson);

    // Use Google Auth client to authenticate and get the Bearer token
    final authClient = await clientViaServiceAccount(accountCredentials, scopes);

    // Get the access token from the auth client
    return right(authClient.credentials.accessToken);
  } catch (e) {
    return left(ApiError(message: e.toString()));
  }
}
