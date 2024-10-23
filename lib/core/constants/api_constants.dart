class ApiConstants {
  // MARK: - Base URL
  static const String baseUrl = "https://exam.elevateegy.com/";

  // MARK: - Auth Endpoints
  static const String loginApi = '/api/v1/auth/signin';
  static const String registerApi = '/api/v1/auth/signup';
  static const String changePasswordApi = '/api/v1/auth/changePassword';
  static const String deleteUserApi = '/api/v1/auth/deleteMe';
  static const String editProfileApi = '/api/v1/auth/editProfile';
  static const String logoutApi = '/api/v1/auth/logout';
  static const String profileDataApi = '/api/v1/auth/profileData';
  static const String forgotPasswordApi = '/api/v1/auth/forgotPassword';
  static const String verifyResetCodeApi = '/api/v1/auth/verifyResetCode';
  static const String resetPasswordApi = '/api/v1/auth/resetPassword';

  // MARK: - Exams Endpoints
  static const String examsApi = '/api/v1/exams';
  static const String specificExamApi = '/api/v1/exam';

  // MARK: - Questions Endpoints
  static const String questionsApi = '/api/v1/questions';
  static const String questionsCheckApi = '/api/v1/questions/check';

  // MARK: - Subjects Endpoints
  static const String subjectsApi = '/api/v1/subjects';
}
