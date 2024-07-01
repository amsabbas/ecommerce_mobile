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

  static const String loginButtonTitle = "loginButtonTitle";
  static const String adminPortalLogin = "adminPortalLogin";
  static const String webAdmin = "webAdmin";
  static const String password = "password";
  static const String username = "username";

  static const String dashboardTitle = "dashboardTitle";
  static const String productsTitle = "productsTitle";
  static const String promosTitle = "promosTitle";
  static const String categoriesTitle = "categoriesTitle";
  static const String areasTitle = "areasTitle";
  static const String ordersTitle = "ordersTitle";
  static const String orderDetailTitle = "orderDetailTitle";
  static const String adsTitle = "adsTitle";
  static const String categoryDetailTitle = "categoryDetailTitle";
  static const String addAddTitle = "addAddTitle";
  static const String addCategoryTitle = "addCategoryTitle";
  static const String addAreaTitle = "addAreaTitle";
  static const String addPromoTitle = "addPromoTitle";
  static const String addProductTitle = "addProductTitle";
  static const String productDetailTitle = "productDetail";

  static const String dashboardTotalOrders = "dashboardTotalOrders";
  static const String dashboardTodayOrders = "todayOrders";
  static const String dashboardTotalUsers = "totalUsers";

  static const String recentOrders = "recentOrders";


  static const String noColumnTitle = "noColumnTitle";
  static const String nameColumnTitle = "nameColumnTitle";
  static const String dateColumnTitle = "dateColumnTitle";
  static const String statusColumnTitle = "statusColumnTitle";
  static const String priceColumnTitle = "priceColumnTitle";
  static const String codeColumnTitle = "codeColumnTitle";
  static const String discountColumnTitle = "discountColumnTitle";
  static const String actionsColumnTitle = "actionsColumnTitle";
  static const String quantityColumnTitle = "quantityColumnTitle";
  static const String descColumnTitle = "descColumnTitle";
  static const String photoColumnTitle = "photoColumnTitle";
  static const String chooseFileTitle = "chooseFileTitle";
  static const String isAvailableColumnTitle = "isAvailableColumnTitle";

  static const String categoryNameTitle = "categoryNameTitle";
  static const String promoCodeTitle = "promoCodeTitle";
  static const String promoDiscountTitle = "promoDiscountTitle";
  static const String productNameTitle = "productNameTitle";
  static const String productDescTitle = "productDescTitle";
  static const String productPriceTitle = "productPriceTitle";
  static const String productQuantityTitle = "productQuantityTitle";
  static const String areaNameTitle = "areaNameTitle";


  static const String deleteTitle = "deleteTitle";
  static const String deleteMessage = "deleteMessage";

  static const String discountValidationMessage = "discountValidationMessage";
  static const String priceValidationMessage = "priceValidationMessage";
  static const String quantityValidationMessage = "quantityValidationMessage";
  static const String imageValidationMessage = "imageValidationMessage";
  static const String categoryValidationMessage = "categoryValidationMessage";

  static const String addButtonTitle  = "addButtonTitle";
  static const String editButtonTitle = "editButtonTitle";
  static const String deleteButtonTitle = "deleteButtonTitle";
  static const String detailButtonTitle = "detailButtonTitle";
  static const String acceptButtonTitle = "acceptButtonTitle";
  static const String rejectButtonTitle = "rejectButtonTitle";
  static const String backButtonTitle = "backButtonTitle";

  static const String pending = "pending";
  static const String accepted = "accepted";
  static const String rejected = "rejected";

  static const String userInfo = "userInfo";
  static const String userName = "userName";
  static const String userEmail = "userEmail";
  static const String userPhone = "userPhone";
  static const String userAddressInfo = "userAddressInfo";
  static const String userStreetName = "userStreetName";
  static const String userBuildingNumber = "userBuildingNumber";
  static const String userFloorNumber = "userFloorNumber";
  static const String userApartmentNumber = "userApartmentNumber";
  static const String orderInfo = "orderInfo";
  static const String orderNo = "orderNo";
  static const String orderDate = "orderDate";
  static const String orderStatus = "orderStatus";
  static const String orderDiscountPrice = "orderDiscountPrice";
  static const String orderSubTotalPrice = "orderSubTotalPrice";
  static const String orderTotalPrice = "orderTotalPrice";
  static const String orderDeliveryPrice = "orderDeliveryPrice";
  static const String orderPaymentMethod = "orderPaymentMethod";
  static const String orderProductInfo = "orderProductInfo";
  static const String orderProductName = "orderProductName";
  static const String orderProductPrice = "orderProductPrice";
  static const String orderProductQuantity = "orderProductQuantity";

}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          MessageKeys.appName: 'Amin Pet Shop',
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
          MessageKeys.adminPortalLogin: "Admin Portal Login",
          MessageKeys.webAdmin: "Web Admin",
          MessageKeys.password: "Password",
          MessageKeys.username: "Username",
          MessageKeys.dashboardTitle: "Dashboard",
          MessageKeys.productsTitle: "Products",
          MessageKeys.promosTitle: "Promos",
          MessageKeys.areasTitle: "Areas",
          MessageKeys.ordersTitle: "Orders",
          MessageKeys.orderDetailTitle: "Order Detail",
          MessageKeys.adsTitle: "Ads",
          MessageKeys.categoryDetailTitle: "Category Detail",
          MessageKeys.addCategoryTitle: "Add Category",
          MessageKeys.addPromoTitle: "Add Promo",
          MessageKeys.addAddTitle: "Add Ad",
          MessageKeys.addAreaTitle: "Add Area",
          MessageKeys.addProductTitle: "Add Product",
          MessageKeys.productDetailTitle: "Product Detail",

          MessageKeys.dashboardTotalOrders: "Total Orders",
          MessageKeys.dashboardTodayOrders: "Today Orders",
          MessageKeys.dashboardTotalUsers: "Total Users",
          MessageKeys.recentOrders: "Recent Orders",

          MessageKeys.categoriesTitle: "Categories",
          MessageKeys.noColumnTitle: "No.",
          MessageKeys.dateColumnTitle: "Date",
          MessageKeys.statusColumnTitle: "Status",
          MessageKeys.priceColumnTitle: "Price",
          MessageKeys.nameColumnTitle: "Name",
          MessageKeys.actionsColumnTitle: "Actions",
          MessageKeys.quantityColumnTitle: "Quantity",
          MessageKeys.descColumnTitle: "Description",
          MessageKeys.isAvailableColumnTitle: "Is Available",
          MessageKeys.codeColumnTitle: "Code",
          MessageKeys.areaNameTitle: "Area Name",
          MessageKeys.discountColumnTitle: "Discount",
          MessageKeys.photoColumnTitle: "Photo",
          MessageKeys.chooseFileTitle: "Choose File",


          MessageKeys.categoryNameTitle: "Category Name",
          MessageKeys.promoCodeTitle: "Promo Code",
          MessageKeys.promoDiscountTitle: "Promo Discount",
          MessageKeys.productNameTitle: "Product Name",
          MessageKeys.productDescTitle: "Product Description",
          MessageKeys.productPriceTitle: "Product Price",
          MessageKeys.productQuantityTitle: "Product Quantity",

          MessageKeys.deleteTitle: "Delete",
          MessageKeys.deleteMessage: "Are you sure you want to delete this item?",

          MessageKeys.discountValidationMessage: "Please enter the discount value correctly",
          MessageKeys.priceValidationMessage: "Please enter the price correctly",
          MessageKeys.quantityValidationMessage: "Please enter the quantity correctly",
          MessageKeys.imageValidationMessage: "Please select an image",
          MessageKeys.categoryValidationMessage: "Please select a category",

          MessageKeys.editButtonTitle: "Edit",
          MessageKeys.deleteButtonTitle: "Delete",
          MessageKeys.addButtonTitle: "Add",
          MessageKeys.detailButtonTitle: "Detail",
          MessageKeys.acceptButtonTitle: "Accept",
          MessageKeys.rejectButtonTitle: "Reject",
          MessageKeys.backButtonTitle: "Back",
          MessageKeys.pending: "Pending",
          MessageKeys.accepted: "Accepted",
          MessageKeys.rejected: "Rejected",

          MessageKeys.userInfo: "User Info",
          MessageKeys.userName: "Username",
          MessageKeys.userEmail: "Email",
          MessageKeys.userPhone: "Phone",
          MessageKeys.userAddressInfo: "Address Info",
          MessageKeys.userStreetName: "Street Name",
          MessageKeys.userBuildingNumber: "Building Number",
          MessageKeys.userFloorNumber: "Floor Number",
          MessageKeys.userApartmentNumber: "Apartment Number",
          MessageKeys.orderInfo: "Order Info",
          MessageKeys.orderNo: "Order No",
          MessageKeys.orderDate: "Order Date",
          MessageKeys.orderStatus: "Order Status",
          MessageKeys.orderDiscountPrice: "Discount Price",
          MessageKeys.orderSubTotalPrice: "Subtotal Price",
          MessageKeys.orderTotalPrice: "Total Price",
          MessageKeys.orderDeliveryPrice: "Delivery fees",
          MessageKeys.orderPaymentMethod: "Payment Method",
          MessageKeys.orderProductInfo: "Product Info",
          MessageKeys.orderProductName: "Product Name",
          MessageKeys.orderProductPrice: "Product Price",
          MessageKeys.orderProductQuantity: "Product Quantity",


        },
        'ar': {
          MessageKeys.appName: 'Amin Pet Shop',
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
          MessageKeys.adminPortalLogin: "تسجيل دخول الإدارة",
          MessageKeys.webAdmin: "الموقع الإلكتروني",
          MessageKeys.password: "كلمة المرور",
          MessageKeys.username: "اسم المستخدم",
          MessageKeys.dashboardTitle: "لوحة التحكم",
          MessageKeys.productsTitle: "المنتجات",
          MessageKeys.ordersTitle: "الطلبات",
          MessageKeys.orderDetailTitle: "تفاصيل الطلب",
          MessageKeys.promosTitle: "العروض",
          MessageKeys.adsTitle: "الإعلانات",
          MessageKeys.categoriesTitle: "الأقسام",
          MessageKeys.areasTitle: "المناطق",
          MessageKeys.productDetailTitle: "تفاصيل المنتج",
          MessageKeys.categoryDetailTitle: "تفاصيل القسم",
          MessageKeys.addCategoryTitle: "إضافة قسم",
          MessageKeys.addPromoTitle: "إضافة عرض",
          MessageKeys.addAreaTitle: "إضافة منطقة",
          MessageKeys.addAddTitle: "إضافة إعلان",
          MessageKeys.addProductTitle: "إضافة منتج",
          MessageKeys.dashboardTotalOrders: "إجمالي الطلبات",
          MessageKeys.dashboardTodayOrders: "طلبات اليوم",
          MessageKeys.dashboardTotalUsers: "إجمالي المستخدمين",
          MessageKeys.recentOrders: "الطلبات الأخيرة",
          MessageKeys.noColumnTitle: "رقم",
          MessageKeys.dateColumnTitle: "تاريخ",
          MessageKeys.statusColumnTitle: "الحالة",
          MessageKeys.priceColumnTitle: "السعر",
          MessageKeys.nameColumnTitle: "الاسم",
          MessageKeys.descColumnTitle: "الوصف",
          MessageKeys.actionsColumnTitle: "العمليات",
          MessageKeys.quantityColumnTitle: "الكمية",
          MessageKeys.isAvailableColumnTitle: "متوفر",
          MessageKeys.codeColumnTitle: "الكود",
          MessageKeys.areaNameTitle: "اسم المنطقة",
          MessageKeys.discountColumnTitle: "الخصم",
          MessageKeys.photoColumnTitle: "الصورة",
          MessageKeys.chooseFileTitle: "اختر ملف",

          MessageKeys.categoryNameTitle: "اسم القسم",
          MessageKeys.promoCodeTitle: "كود العرض",
          MessageKeys.promoDiscountTitle: "نسبة الخصم",
          MessageKeys.productNameTitle: "اسم المنتج",
          MessageKeys.productDescTitle: "وصف المنتج",
          MessageKeys.productPriceTitle: "سعر المنتج",
          MessageKeys.productQuantityTitle: "كمية المنتج",


          MessageKeys.deleteTitle: "حذف",
          MessageKeys.deleteMessage: "هل أنت متأكد من حذف هذا العنصر؟",

          MessageKeys.discountValidationMessage: "الرجاء إدخال نسبة الخصم بشكل صحيح",
          MessageKeys.priceValidationMessage: "الرجاء إدخال السعر بشكل صحيح",
          MessageKeys.quantityValidationMessage: "الرجاء إدخال الكمية بشكل صحيح",
          MessageKeys.imageValidationMessage: "الرجاء اختيار صورة",
          MessageKeys.categoryValidationMessage: "الرجاء اختيار قسم",

          MessageKeys.editButtonTitle: "تعديل",
          MessageKeys.deleteButtonTitle: "حذف",
          MessageKeys.addButtonTitle: "إضافة",
          MessageKeys.detailButtonTitle: "تفاصيل",
          MessageKeys.acceptButtonTitle: "قبول",
          MessageKeys.rejectButtonTitle: "رفض",
          MessageKeys.backButtonTitle: "رجوع",

          MessageKeys.pending: "قيد الانتظار",
          MessageKeys.accepted: "مقبول",
          MessageKeys.rejected: "مرفوض",

          MessageKeys.userInfo: "معلومات المستخدم",
          MessageKeys.userName: "اسم المستخدم",
          MessageKeys.userEmail: "البريد الإلكتروني",
          MessageKeys.userPhone: "رقم الهاتف",
          MessageKeys.userAddressInfo: "معلومات العنوان",
          MessageKeys.userStreetName: "اسم الشارع",
          MessageKeys.userBuildingNumber: "رقم المبنى",
          MessageKeys.userFloorNumber: "رقم الطابق",
          MessageKeys.userApartmentNumber: "رقم الشقة",
          MessageKeys.orderInfo: "معلومات الطلب",
          MessageKeys.orderNo: "رقم الطلب",
          MessageKeys.orderDate: "تاريخ الطلب",
          MessageKeys.orderStatus: "حالة الطلب",
          MessageKeys.orderDiscountPrice: "سعر الخصم",
          MessageKeys.orderSubTotalPrice: "السعر الكلي",
          MessageKeys.orderTotalPrice: "السعر الإجمالي",
          MessageKeys.orderDeliveryPrice: "رسوم التوصيل",
          MessageKeys.orderPaymentMethod: "طريقة الدفع",
          MessageKeys.orderProductInfo: "معلومات المنتج",
          MessageKeys.orderProductName: "اسم المنتج",
          MessageKeys.orderProductPrice: "سعر المنتج",
          MessageKeys.orderProductQuantity: "كمية المنتج",

        }

      };
}
