class ApiUrls{
  final  String SEND_DATA= 'http://192.168.2.25:8051/api/users';
  final  String RESET_PASSWORD= 'http://192.168.2.25:8051/api/users/reset-password';
  final String LOGIN = 'http://192.168.2.25:8051/auth/login';
  final String LOGINOAUTH = 'http://192.168.2.25:8051/auth/login/oauth';
  final String LOGOUT = 'http://192.168.2.25:8051/auth/logout';
  static String exists(String email){
  return "http://192.168.2.25:8051/users/exists/${email}";}
}