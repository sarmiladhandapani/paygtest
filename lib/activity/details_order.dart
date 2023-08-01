import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test123/model/order_detail_response.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetails createState() => _OrderDetails();
}

class _OrderDetails extends State<OrderDetails> {
  static const String AuthenticationKey = 'd0eb8a879c744a18b927f48505a13787';
  static const String AuthenticationToken = 'df577deab30a4d97913be019b5808769';
  static const String MerchantKeyId = '34050';
  static const String orderId = '210823M7963UPsj0saZFkS';
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  bool _validate = false;
  final myController = TextEditingController();
  bool _isLoading = false;

  var _formKey = GlobalKey<FormState>();

  final orderIdController = TextEditingController();

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
    orderIdController.dispose();
    myController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    this.orderDetail();
  }

  Future<OrderDetailResponse> orderDetail() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "Merchantkeyid": MerchantKeyId,
      "OrderKeyId": orderIdController.text,
      "PaymentType": '',
    };
    var jsonString = json.encode(data);
    String credentials =
        AuthenticationKey + ':' + AuthenticationToken + ':M:' + MerchantKeyId;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    var response = await http.post(
        Uri.parse('https://uatapi.payg.in/payment/api/order/Detail'),
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
                          title: Text("ORDER DETAILS",
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
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: TextFormField(
                                    controller: orderIdController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter order Id';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Order Id',
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
                              ],
                            ),
                          )),
                        )))));
  }
}
