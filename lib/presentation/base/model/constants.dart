//general
import 'package:get/get.dart';

const String acceptedStatus = 'accepted';
const String pendingStatus = 'pending';
const String rejectedStatus = 'rejected';
const String cashPayment = 'cash';
const String visaPayment = 'visa';

//URLs
const String scheme = 'http';
const String baseURL = "http://64.227.65.185:3000/";
const String successPaymentURL = "http://64.227.65.185:3000/orders/paySuccess";


//firebase
const String firebaseApiKey = "AIzaSyAIMFNbvpwTHdbpX7o_nBWmy-JmODVMfCc";
const String firebaseAppId = "1:681909148680:ios:7995feef6a89692a44c5bd";
const String firebaseMessagingSenderId = "681909148680";
const String firebaseProjectId = "ecommerce-57aeb";


const Transition appTransition = Transition.fade;