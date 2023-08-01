import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test123/model/order_detail_response.dart';
import 'package:test123/model/order_update_response.dart';

class OrderUpdate extends StatefulWidget {
  const OrderUpdate({Key? key}) : super(key: key);

  @override
  _OrderUpdate createState() => _OrderUpdate();
}

class _OrderUpdate extends State<OrderUpdate> {
  static const String defaultDate = "1987-06-30";
  static const bool isSubmitted = false;
  static const String paymentURL = 'https://uatapi.payg.in/payment/api/order';
  static const String AuthenticationKey = 'd0eb8a879c744a18b927f48505a13787';
  static const String AuthenticationToken = 'df577deab30a4d97913be019b5808769';
  static const String SecureHashKey = '7c6ea7318f944ff3ab02fb4c2e852c7d';
  static const String MerchantKeyId = '34050';
  static const String RedirectUrl = 'https://payg.in/';
  static const int timeout = 30;
  static const String possibleChar =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890hasjhdsjahdjksahdkhsakd";
  static const String orderKeyId = "210823M7963UPsj0saZFkS";
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

  bool _validate = false;
  final myController = TextEditingController();
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  bool _isLoading = false;
  var _formKey = GlobalKey<FormState>();

  final orderIdController = TextEditingController();
  final orderAmountController = TextEditingController();
  final orderFirstNameController = TextEditingController();
  final orderLastNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();

  _startLoading() {
    setState(() {
      _isLoading = true;
    });

    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
    myController.dispose();
    orderIdController.dispose();
    orderAmountController.dispose();
    orderFirstNameController.dispose();
    orderLastNameController.dispose();
    mobileNoController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    this.updateOrder();
  }

  Future<OrderUpdateResponse> updateOrder() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "Merchantkeyid": MerchantKeyId,
      "UniqueRequestId": getRandomString(10),
      "OrderKeyId": orderIdController.text,
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
      "OrderAmountData": {"AmountTypeDesc": amountTypeDesc, "Amount": ""},
      "CustomerData": {
        'CustomerId': CustomerId,
        'CustomerNotes': customerNotes,
        'FirstName': orderFirstNameController.text,
        'LastName': orderLastNameController.text,
        'MobileNo': mobileNoController.text,
        'Email': emailController.text,
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
    var jsonString = json.encode(
        data); // upload jsonString as body to your server. print("Json String is " + jsonString);

    String credentials =
        AuthenticationKey + ':' + AuthenticationToken + ':M:' + MerchantKeyId;

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    var response = await http.put(
        Uri.parse('https://uatapi.payg.in/payment/api/order/Update'),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Basic ' + encoded
        },
        body: jsonString);
    var jsonResponse = jsonDecode(response.body);
    setState(() {
      _isLoading = false;
    });
    myController.text = jsonResponse.toString();
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: _isLoading
                ? CircularProgressIndicator()
                : Container(
                    child: Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.white,
                          leading: IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          title: Text("UPDATE ORDER",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                        body: SafeArea(
                          child: SingleChildScrollView(
                              child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: TextField(
                                    enabled: false,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    controller: myController,
                                  ),
                                ),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: orderIdController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter order Key Id';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Order Key Id*',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: orderAmountController,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Order Type',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Amount Type Desc',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Amount',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Customer Notes',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: orderFirstNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter First Name';
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: orderLastNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter Last Name';
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: mobileNoController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter Mobile No';
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email*',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Email Receipt',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Billing Address',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Billing City',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Billing State',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Billing Country',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Billing Zip Code',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping First Name',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping Last Name',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping Address',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping City',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping State',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping Country',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping Zip Code',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Shipping Mobile No.',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'User Name',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Source',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Integration Type',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Hash Data',
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Platform Id',
                                    ),
                                  ),
                                )),
                                Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
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
                        )))));
  }
}
