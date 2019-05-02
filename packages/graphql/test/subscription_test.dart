import 'package:amazon_cognito_identity_dart/cognito.dart';


void main() async {
  const String _awsUserPoolId = 'us-east-1_Sqw0eBfMT';
  const String _awsClientId = '3utsndb4vdaaovogbt8p9f1kqa';

  const String _identityPoolId =
      'us-east-1:7473978a-c01c-4943-b943-c38c9838cc75';
  final CognitoUserPool _userPool =
      CognitoUserPool(_awsUserPoolId, _awsClientId);
  const String _user = 'admin@example.com';

  final CognitoUser _cognitoUser = CognitoUser(_user, _userPool);
  final AuthenticationDetails authDetails =
      AuthenticationDetails(username: _user, password: 'Passw0rd!');

  CognitoUserSession _session;
  try {
    _session = await _cognitoUser.authenticateUser(authDetails);
  } catch (e) {
    print(e);
    return;
  }

  final CognitoCredentials _credentials =
      CognitoCredentials(_identityPoolId, _userPool);
  await _credentials.getAwsCredentials(_session.getIdToken().getJwtToken());

  const String _endpoint =
      'https://w5odhws77naw7mozxls46ovxjq.appsync-api.us-east-1.amazonaws.com/graphql';






  final Operation o =  Operation(document: body3);
  final Stream<FetchResult> stream = client.subscribe(o);

}