import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test123/activity/WebViewContainer.dart';
import 'package:test123/model/payment_success.dart';

class PayOrder extends StatefulWidget {
  const PayOrder({Key? key}) : super(key: key);

  @override
  _PayOrder createState() => _PayOrder();
}

class _PayOrder extends State<PayOrder> {
  static const String paymentURL = 'https://uatapi.payg.in/payment/api/order';
  static const String AuthenticationKey = 'd0eb8a879c744a18b927f48505a13787';
  static const String AuthenticationToken = 'df577deab30a4d97913be019b5808769';
  static const String SecureHashKey = '7c6ea7318f944ff3ab02fb4c2e852c7d';
  static const String MerchantKeyId = '34050';
  static const String RedirectUrl = 'https://payg.in/';
  static const String orderAmount = "";
  static const String orderType = "";
  static const String amountTypeDesc = "";
  static const String amount = "";
  static const String customerNotes = "";
  static const String firstName = "";
  static const String lastName = "";
  static const String mobileNo = "";
  static const String email = "";
  static const String emailReceipt = "";
  static const String billingAddress = "";
  static const String billingCity = "";
  static const String billingState = "";
  static const String billingCountry = "";
  static const String billingZipCode = "";
  static const String shippingFirstName = "";
  static const String shippingLastName = "";
  static const String shippingAddress = "";
  static const String shippingCity = "";
  static const String shippingState = "";
  static const String shippingCountry = "";
  static const String shippingZipCode = "";
  static const String shippingMobileNo = "";
  static const String userName = "";
  static const String Source = "";
  static const String Integration = "";
  static const String HashData = "";
  static const String PlatformId = "";
  static const String CustomerId = "";

  var _formKey = GlobalKey<FormState>();
  bool _validate = false;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  final orderAmountController = TextEditingController();
  final orderFirstNameController = TextEditingController();
  final orderLastNameController = TextEditingController();
  final mobileNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    orderAmountController.dispose();
    orderFirstNameController.dispose();
    orderLastNameController.dispose();
    mobileNoController.dispose();
    super.dispose();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<PaymentSuccess> createOrder() async {
    var data1 = {
      "Merchantkeyid": MerchantKeyId,
      "UniqueRequestId": getRandomString(10),
      "OrderStatus": 'Initiating',
      "UserDefinedData": {"UserDefined1": ''},
      "RequestDateTime": "11/08/2021",
      "RedirectUrl": RedirectUrl,
      "TransactionData": {
        "AcceptedPaymentTypes": '',
        "PaymentType": orderType,
        "SurchargeType": orderType,
        "SurchargeValue": orderType,
        "RefTransactionId": orderType,
        "IndustrySpecificationCode": orderType,
        "PartialPaymentOption": orderType,
      },
      "OrderAmount": orderAmountController.text,
      "OrderType": 'MOBILE',
      "OrderAmountData": {"AmountTypeDesc": amountTypeDesc, "Amount": "20"},
      "CustomerData": {
        'CustomerId': CustomerId,
        'CustomerNotes': customerNotes,
        'FirstName': orderFirstNameController.text,
        'LastName': orderLastNameController.text,
        'MobileNo': mobileNoController.text,
        'Email': email,
        'EmailReceipt': emailReceipt,
        'BillingAddress': billingAddress,
        'BillingCity': billingCity,
        'BillingState': billingState,
        'BillingCountry': billingCountry,
        'BillingZipCode': billingZipCode,
        'ShippingFirstName': shippingFirstName,
        'ShippingLastName': shippingLastName,
        'ShippingAddress': shippingAddress,
        'ShippingCity': shippingCity,
        'ShippingState': shippingState,
        'ShippingCountry': shippingCountry,
        'ShippingZipCode': shippingZipCode,
        'ShippingMobileNo': shippingMobileNo,
      },
      "IntegrationData": {
        "UserName": userName,
        "Source": 'MobileSDK',
        "IntegrationType": "11",
        "HashData": HashData,
        "PlatformId": PlatformId,
      }
    };

    var data = {
      "Merchantkeyid": MerchantKeyId,
      "UniqueRequestId": "f3f5b5c13f",
      "UserDefinedData": {"UserDefined1": ""},
      "RequestDateTime": "06232021",
      "RedirectUrl": "https://payg.in",
      "TransactionData": {
        "AcceptedPaymentTypes": "",
        "PaymentType": "",
        "SurchargeType": "",
        "SurchargeValue": "",
        "RefTransactionId": "",
        "IndustrySpecificationCode": "",
        "PartialPaymentOption": ""
      },
      "OrderAmount": "100",
      "OrderType": "",
      "OrderAmountData": {"AmountTypeDesc": "3", "Amount": "2"},
      "CustomerData": {
        "CustomerId": "152433",
        "CustomerNotes": "amway product",
        "FirstName": "kanhaiya",
        "LastName": "dhaked",
        "MobileNo": "08619083450",
        "Email": "demo@gmail.com",
        "EmailReceipt": "true",
        "BillingAddress": "44 bhawar nagar semal",
        "BillingCity": "semla",
        "BillingState": "Rajasthan",
        "BillingCountry": "India",
        "BillingZipCode": "30202020",
        "ShippingFirstName": "yagyang",
        "ShippingLastName": "dhaked",
        "ShippingAddress": "44 bhawar nagar semal",
        "ShippingCity": "semla",
        "ShippingState": "Rajasthan",
        "ShippingCountry": "India",
        "ShippingZipCode": "30202020",
        "ShippingMobileNo": "08619083450"
      },
      "IntegrationData": {
        "UserName": "ranjith",
        "Source": "3213",
        "IntegrationType": "11",
        "HashData": "",
        "PlatformId": "1"
      },
    };
    var jsonString = json.encode(
        data); // upload jsonString as body to your server. print("Json String is " + jsonString);

    String credentials =
        AuthenticationKey + ':' + AuthenticationToken + ':M:' + MerchantKeyId;
    print(credentials);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    String decoded = stringToBase64.decode(encoded);
    print(encoded);
    print(decoded);
    var response = await http.post(
        Uri.parse('https://uatapi.payg.in/payment/api/order/create'),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Basic ' + encoded
        },
        body: jsonString);
    debugPrint((response.body).toString());
    print('hiiii');
    var jsonResponse = jsonDecode(response.body);
    String url = jsonResponse['PaymentProcessUrl'];
    print(url);
    _handleURLButtonPress(context, url);
    return PaymentSuccess.fromJson(jsonDecode(response.body));
  }

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    this.createOrder();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("CREATE ORDER",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      controller: orderAmountController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter order amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Order Amount*',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: orderType,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Order Type',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: amountTypeDesc,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Amount Type Desc',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: amount,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Amount',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: customerNotes,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Customer Notes',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      controller: orderFirstNameController,
                      onFieldSubmitted: (value) {
                        // orderAmount = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please first name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'First Name*',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      controller: orderLastNameController,
                      onFieldSubmitted: (value) {
                        // orderAmount = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please last name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Last Name*',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      controller: mobileNoController,
                      onFieldSubmitted: (value) {
                        // orderAmount = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Mobile No.*',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: email,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: emailReceipt,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email Receipt',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: billingAddress,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Billing Address',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: billingCity,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Billing City',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: billingState,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Billing State',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: billingCountry,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Billing Country',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: billingZipCode,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Billing Zip Code',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingFirstName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping First Name',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingLastName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Last Name',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingAddress,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Address',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingCity,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping City',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingState,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping State',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingCountry,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Country',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingZipCode,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Zip Code',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: shippingMobileNo,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Mobile No.',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: userName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: Source,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Source',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: Integration,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Integration Type',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: HashData,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Hash Data',
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      // controller: PlatformId,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Platform Id',
                      ),
                    ),
                  )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        // textColor: Colors.white,
                        // color: Colors.red,
                        child: Text('Submit'),
                        onPressed: () {
                          _submit();
                        },
                      )),
                ],
              ),
            )),
          )),
      // builder: EasyLoading.init,
    );
  }
}
