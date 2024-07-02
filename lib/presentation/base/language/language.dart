import 'package:get/get.dart';

class MessageKeys {
  static const String appName = "appName";
  static const String networkError = "NetworkError";
  static const String unKnown = "UnKnownError";
  static const String error = "error";
  static const String errorTitle = "errorTitle";
  static const String errorMessage = "errorMessage";
  static const String unAuthorized = "Unauthorized";
  static const String retry = "retry";
  static const String close = "close";
  static const String cancel = "cancel";
  static const String accept = "accept";
  static const String success = 'success';
  static const String alert = 'alert';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String ok = "OK";
  static const String dismiss = "dismiss";
  static const String welcome = "welcome";
  static const String viewMore = "viewMore";
  static const String noData = "noData";
  static const String noFound = "noFound";
  static const String logoutButtonTitle = "logoutButtonTitle";
  static const String submitButtonTitle = "submitButtonTitle";

  static const String loginButtonTitle = "loginButtonTitle";
  static const String password = "password";
  static const String username = "username";
  static const String email = "email";
  static const String name = "name";
  static const String phone = "phone";

  static const String registerTitle = "registerTitle";
  static const String registerSuccessMessage = "registerSuccessMessage";
  static const String registerButtonTitle = "registerButtonTitle";
  static const String registerNoAccountTitle = "registerNoAccountTitle";
  static const String forgotPasswordButtonTitle = "forgotPasswordButtonTitle";
  static const String forgotPasswordTitle = "forgotPasswordTitle";
  static const String forgotPasswordSuccessMessage = "forgotPasswordSuccessMessage";

  static const String pending = "pending";
  static const String accepted = "accepted";
  static const String rejected = "rejected";


}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          MessageKeys.appName: 'Ecommerce Mobile',
          MessageKeys.alert: 'Attention',
          MessageKeys.networkError:
              "Please make sure you are connected to the internet",
          MessageKeys.unKnown: "Unknown error, please try again",
          MessageKeys.unAuthorized: "UnAuthorized, please re-login",
          MessageKeys.error: "Error",
          MessageKeys.errorMessage: "Try again later",
          MessageKeys.errorTitle: "Failed to load page",
          MessageKeys.cancel: "Cancel",
          MessageKeys.success: "Great",
          MessageKeys.accept: "Accept",
          MessageKeys.close: "Close",
          MessageKeys.yes: "Yes",
          MessageKeys.no: "No",
          MessageKeys.ok: "OK",
          MessageKeys.retry: "Retry",
          MessageKeys.dismiss: "Hide",
          MessageKeys.welcome: "Welcome!",
          MessageKeys.noData: "No data",
          MessageKeys.viewMore: "Show more",
          MessageKeys.noFound: "Not found",
          MessageKeys.logoutButtonTitle: "Logout",
          MessageKeys.loginButtonTitle: "Login",
          MessageKeys.password: "Password",
          MessageKeys.username: "Username",
          MessageKeys.email: "Email",
          MessageKeys.name: "Name",
          MessageKeys.phone: "Phone",
          MessageKeys.registerTitle: "Sign up",
          MessageKeys.forgotPasswordButtonTitle: "Forgot Password?",
          MessageKeys.registerNoAccountTitle: "Don't have an account?",
          MessageKeys.registerButtonTitle: "Register",
          MessageKeys.forgotPasswordTitle : "Forgot Password",
          MessageKeys.submitButtonTitle: "Submit",
          MessageKeys.forgotPasswordSuccessMessage: "Email is sent successfully",
          MessageKeys.registerSuccessMessage: "Congratulations! Your account has been successfully created",
          MessageKeys.pending: "Pending",
          MessageKeys.accepted: "Accepted",
          MessageKeys.rejected: "Rejected",

        },
        'ar': {
          MessageKeys.appName: 'Ecommerce Mobile',
          MessageKeys.alert: 'تنبيه',
          MessageKeys.networkError: "الرجاء التأكد من الإتصال بالشبكة",
          MessageKeys.unKnown: "حدث خطأ غير معروف الرجاء إعادة المحاولة",
          MessageKeys.unAuthorized: "يجب إعادة تسجيل الدخول",
          MessageKeys.error: "خطأ",
          MessageKeys.errorMessage: "حاول مرة أخرى في وقت لاحق",
          MessageKeys.errorTitle: "فشل تحميل الصفحة",
          MessageKeys.cancel: "إلغاء",
          MessageKeys.close: "إغلاق",
          MessageKeys.ok: "حسنا",
          MessageKeys.success: "نجاج",
          MessageKeys.yes: "نعم",
          MessageKeys.no: "لا",
          MessageKeys.retry: "إعادة المحاولة",
          MessageKeys.dismiss: "إخفاء",
          MessageKeys.accept: "موافق",
          MessageKeys.welcome: "مرحبا بك",
          MessageKeys.noData: "لايوجد بيانات",
          MessageKeys.viewMore: "عرض المزيد",
          MessageKeys.noFound: "لا يوجد",
          MessageKeys.logoutButtonTitle: "تسجيل الخروج",
          MessageKeys.loginButtonTitle: "تسجيل الدخول",
          MessageKeys.password: "كلمة المرور",
          MessageKeys.username: "اسم المستخدم",
          MessageKeys.email: "البريد الإلكتروني",
          MessageKeys.name: "اسم المستخدم",
          MessageKeys.phone: "رقم الهاتف",
          MessageKeys.registerTitle: "تسجيل المستخدم",
          MessageKeys.forgotPasswordButtonTitle: "نسيت كلمة المرور؟",
          MessageKeys.registerNoAccountTitle: "ليس لديك حساب؟",
          MessageKeys.registerButtonTitle: "تسجيل",
          MessageKeys.forgotPasswordTitle : "نسيت كلمة المرور",
          MessageKeys.forgotPasswordSuccessMessage: "تم إرسال البريد الإلكتروني بنجاح",
          MessageKeys.submitButtonTitle: "إرسال",
          MessageKeys.registerSuccessMessage: "تهانينا! لقد تم إنشاء حسابك بنجاح",

          MessageKeys.pending: "قيد الانتظار",
          MessageKeys.accepted: "مقبول",
          MessageKeys.rejected: "مرفوض",




        }

      };
}
