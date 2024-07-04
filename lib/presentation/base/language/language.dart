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
  static const String submitButtonTitle = "submitButtonTitle";
  static const String saveButtonTitle = "saveButtonTitle";
  static const String alert = 'alert';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String ok = "OK";
  static const String dismiss = "dismiss";
  static const String welcome = "welcome";
  static const String viewMore = "viewMore";
  static const String noData = "noData";
  static const String noFound = "noFound";
  static const String pending = "pending";
  static const String accepted = "accepted";
  static const String rejected = "rejected";

  static const String seeYouSoonTitle = "seeYouSoonTitle";
  static const String homeWelcomeTitle = "homeWelcomeTitle";

  static const String logoutButtonTitle = "logoutButtonTitle";
  static const String logoutMessage = "logoutMessage";

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

  static const String homeTitle = "homeTitle";
  static const String ordersTitle = "ordersTitle";
  static const String accountTitle = "accountTitle";


  static const String changeLanguageDialogTitle = "changeLanguageDialogTitle";
  static const String englishTitle = "englishTitle";
  static const String arabicTitle = "arabicTitle";
  static const String profileNotLoggedTitle = "profileNotLoggedTitle";
  static const String profileTitle = "profileTitle";
  static const String myAddressesTitle = "myAddressesTitle";
  static const String settingsTitle = "settingsTitle";
  static const String languageTitle = "languageTitle";
  static const String callUsTitle = "callUsTitle";
  static const String reachOutTitle = "reachOutTitle";
  static const String updateProfileSuccessMessage= "updateProfileSuccessMessage";

  static const String emptyTextFieldValidationMessage = "emptyTextFieldValidationMessage";

  static const String locationDisabledTitle = "locationDisabledTitle";
  static const String noAddresses = "noAddresses";
  static const String addAddressButtonTitle = "addAddressButtonTitle";
  static const String selectLocationTitle = "selectLocationTitle";
  static const String areasTitle = "areasTitle";
  static const String areaValidationEmpty = "areaValidationEmpty";
  static const String cityValidationEmpty = "cityValidationEmpty";
  static const String selectAddressButtonTitle = "selectAddressButtonTitle";
  static const String deliveryLocationTitle = "deliveryLocationTitle";
  static const String buildingNoTitle = "buildingNoTitle";
  static const String buildNoHintTitle = "buildNoHintTitle";
  static const String apartmentNoTitle = "apartmentNoTitle";
  static const String apartmentNoHintTitle = "apartmentNoHintTitle";
  static const String floorNoTitle = "floorNoTitle";
  static const String floorNoHintTitle = "floorNoHintTitle";
  static const String streetNameTitle = "streetNameTitle";
  static const String streetNameHintTitle = "addressNameHintTitle";
  static const String addAddressSuccessMessage = "addAddressSuccessMessage";
  static const String deleteAddressSuccessMessage =
      "deleteAddressSuccessMessage";
  static const String deleteAddressConfirmationMessage =
      "deleteAddressConfirmationMessage";
  static const String changeDefaultAddressTitle = "changeDefaultAddressTitle";
  static const String shippingAddressTitle = "shippingAddressTitle";

  static const String noOrdersTitle = "noOrdersTitle";
  static const String orderNumberTitle = "orderNumberTitle";
  static const String orderQuantityTitle = "orderQuantityTitle";
  static const String orderDateTitle = "orderDateTitle";
  static const String orderDetailsTitle = "orderDetailsTitle";
  static const String subTotalTitle = "subTotalTitle";
  static const String deliveryFeesTitle = "deliveryFeesTitle";
  static const String discountTitle = "discountTitle";
  static const String totalAmountTitle = "totalAmountTitle";
  static const String paymentTitle = "paymentTitle";
  static const String deliveryDateTitle = "deliveryDateTitle";

  static const String productsTitle = "productsTitle";
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

          MessageKeys.homeWelcomeTitle: "Welcome,",
          MessageKeys.seeYouSoonTitle: "See you soon!",

          MessageKeys.logoutButtonTitle: "Logout",
          MessageKeys.logoutMessage: "Are you sure you want to logout?",
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
          MessageKeys.saveButtonTitle: "Save",
          MessageKeys.forgotPasswordSuccessMessage: "Email is sent successfully",
          MessageKeys.registerSuccessMessage: "Congratulations! Your account has been successfully created",
          MessageKeys.pending: "Pending",
          MessageKeys.accepted: "Accepted",
          MessageKeys.rejected: "Rejected",

          MessageKeys.homeTitle: "Home",
          MessageKeys.ordersTitle: "Orders",
          MessageKeys.accountTitle: "Account",

          MessageKeys.changeLanguageDialogTitle: "Change Language",
          MessageKeys.englishTitle: "English",
          MessageKeys.arabicTitle: "Arabic",
          MessageKeys.profileNotLoggedTitle: "You are not logged in",
          MessageKeys.profileTitle: "Profile",
          MessageKeys.myAddressesTitle: "My Addresses",
          MessageKeys.settingsTitle: "Settings",
          MessageKeys.languageTitle: "Language",
          MessageKeys.callUsTitle: "Call Us",
          MessageKeys.reachOutTitle: "Reach Out",

          MessageKeys.updateProfileSuccessMessage: "Profile updated successfully",

          MessageKeys.emptyTextFieldValidationMessage: "This field is required",


          MessageKeys.noAddresses: "No addresses found",
          MessageKeys.addAddressButtonTitle: "Add address",
          MessageKeys.selectLocationTitle: "Select Location",
          MessageKeys.locationDisabledTitle:
          "Location service on the device is disabled, please enable it",
          MessageKeys.areasTitle: "Areas",
          MessageKeys.cityValidationEmpty: "You must select city name",
          MessageKeys.areaValidationEmpty: "You must select area name",
          MessageKeys.selectAddressButtonTitle: "Add",
          MessageKeys.deliveryLocationTitle: "Delivery Location",
          MessageKeys.buildingNoTitle: "Building No",
          MessageKeys.buildNoHintTitle: "Write here your building number",
          MessageKeys.apartmentNoTitle: "Apartment No",
          MessageKeys.apartmentNoHintTitle: "Write here your apartment number",
          MessageKeys.floorNoTitle: "Floor No",
          MessageKeys.floorNoHintTitle: "Write here your floor number",
          MessageKeys.streetNameTitle: "Street Name",
          MessageKeys.streetNameHintTitle: "Write here your address name",
          MessageKeys.addAddressSuccessMessage: "Address is added successfully",
          MessageKeys.deleteAddressSuccessMessage:
          "Address is deleted successfully",
          MessageKeys.deleteAddressConfirmationMessage:
          "Are you sure to delete this address ?",
          MessageKeys.changeDefaultAddressTitle: "Use as the primary address",
          MessageKeys.shippingAddressTitle: "Shipping address",

          MessageKeys.noOrdersTitle: "No Orders found\nLooks like you haven't placed any orders yet.",
          MessageKeys.orderNumberTitle: "Order no:",
          MessageKeys.orderQuantityTitle: "Quantity:",
          MessageKeys.orderDateTitle: "Date:",
          MessageKeys.orderDetailsTitle: "Order details",
          MessageKeys.subTotalTitle: "Subtotal",
          MessageKeys.discountTitle: "Discount",
          MessageKeys.deliveryFeesTitle: "Delivery fees",
          MessageKeys.totalAmountTitle: "Total amount",
          MessageKeys.paymentTitle: "Payment",
          MessageKeys.deliveryDateTitle: "Delivery date/time",

          MessageKeys.productsTitle: "Products",
        },
        'ar': {
          MessageKeys.appName: 'متجر الكتروني',
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

          MessageKeys.seeYouSoonTitle: "أراك قريبا!",
          MessageKeys.homeWelcomeTitle: "مرحبا",

          MessageKeys.logoutButtonTitle: "تسجيل الخروج",
          MessageKeys.logoutMessage: "هل أنت متأكد من تسجيل الخروج؟",
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
          MessageKeys.saveButtonTitle: "حفظ",
          MessageKeys.registerSuccessMessage: "تهانينا! لقد تم إنشاء حسابك بنجاح",

          MessageKeys.pending: "قيد الانتظار",
          MessageKeys.accepted: "مقبول",
          MessageKeys.rejected: "مرفوض",

          MessageKeys.homeTitle: "الرئيسية",
          MessageKeys.ordersTitle: "الطلبات",
          MessageKeys.accountTitle: "الحساب",

          MessageKeys.changeLanguageDialogTitle: "تغيير اللغة",
          MessageKeys.englishTitle: "الإنجليزية",
          MessageKeys.arabicTitle: "العربية",
          MessageKeys.profileNotLoggedTitle: "لم تقم بتسجيل الدخول بعد",
          MessageKeys.profileTitle: "الملف الشخصي",
          MessageKeys.myAddressesTitle: "عناويني",
          MessageKeys.settingsTitle: "الإعدادات",
          MessageKeys.languageTitle: "اللغة",
          MessageKeys.callUsTitle: "اتصل بنا",
          MessageKeys.reachOutTitle: "تواصل معنا",

          MessageKeys.updateProfileSuccessMessage: "تم تحديث الملف الشخصي بنجاح",

          MessageKeys.emptyTextFieldValidationMessage: "هذا الحقل مطلوب",

          MessageKeys.locationDisabledTitle: "خدمة تحديد الموقع على الجهاز معطلة، الرجاء تفعيلها",

          MessageKeys.noAddresses: "لم يتم العثور على عناوين",
          MessageKeys.addAddressButtonTitle: "اضافة عنوان",
          MessageKeys.selectLocationTitle: "اختر الموقع",
          MessageKeys.areasTitle: "المنطقة",
          MessageKeys.cityValidationEmpty: "يجب اختيار محافظة",
          MessageKeys.areaValidationEmpty: "يجب اختيار منطقة",
          MessageKeys.selectAddressButtonTitle: "اضف",
          MessageKeys.deliveryLocationTitle: "موقع التوصيل",
          MessageKeys.buildingNoTitle: "رقم المبني",
          MessageKeys.buildNoHintTitle: "كتب هنا رقم المبني",
          MessageKeys.apartmentNoTitle: "رقم الشقة",
          MessageKeys.apartmentNoHintTitle: "اكتب هنا رقم الشقة",
          MessageKeys.floorNoTitle: "رقم الدور",
          MessageKeys.floorNoHintTitle: "اكتب هنا رقم الدور",
          MessageKeys.streetNameTitle: "اسم الشارع",
          MessageKeys.streetNameHintTitle: "اكتب هنا اسم الشارع",
          MessageKeys.addAddressSuccessMessage: "تم اضافة العنوان بنجاح",
          MessageKeys.deleteAddressSuccessMessage: "تم حذف العنوان بنجاح",
          MessageKeys.deleteAddressConfirmationMessage:
          "هل انت متاكد من حذف هذا العنوان ؟",
          MessageKeys.changeDefaultAddressTitle: "استخدم كعنوان الشحن",
          MessageKeys.shippingAddressTitle: "عنوان الشحن",

          MessageKeys.noOrdersTitle: "لم يتم العثور على طلبات، يبدو أنك لم تقم بإجراء أي طلب بعد.",
          MessageKeys.orderNumberTitle: "رقم الطلب:",
          MessageKeys.orderQuantityTitle: "الكمية:",
          MessageKeys.discountTitle: "الخصم:",
          MessageKeys.orderDateTitle: "تاريخ الطلب:",
          MessageKeys.orderDetailsTitle: "تفاصيل الطلب",
          MessageKeys.subTotalTitle: "المجموع الفرعي",
          MessageKeys.deliveryFeesTitle: "رسوم التوصيل",
          MessageKeys.totalAmountTitle: "المبلغ الإجمالي",
          MessageKeys.paymentTitle: "طريقة الدفع",
          MessageKeys.deliveryDateTitle: "تاريخ/وقت التسليم",

          MessageKeys.productsTitle: "المنتجات",

        }

      };
}
