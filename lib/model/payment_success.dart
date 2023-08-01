/// OrderKeyId : "210713M11130U6a0cbb0e7c"
/// MerchantKeyId : 11130
/// UniqueRequestId : "6a0cbb0e7c"
/// OrderType : "PAYMENT"
/// OrderAmount : 1.0
/// OrderId : null
/// OrderStatus : null
/// OrderPaymentStatus : 0
/// OrderPaymentStatusText : null
/// PaymentStatus : 0
/// PaymentTransactionId : "586303"
/// PaymentResponseCode : 4
/// PaymentApprovalCode : null
/// PaymentTransactionRefNo : null
/// PaymentResponseText : "Pending"
/// PaymentMethod : null
/// PaymentAccount : null
/// OrderNotes : null
/// PaymentDateTime : null
/// UpdatedDateTime : null
/// PaymentProcessUrl : "https://payg.in/payment/payment?orderid=210713M11130U6a0cbb0e7c"
/// OrderPaymentCustomerData : {"FirstName":"ramu","LastName":null,"Address":null,"City":null,"State":null,"ZipCode":null,"Country":null,"MobileNo":"98766543210","Email":"ramu@gmail.com","UserId":null,"IpAddress":null}
/// UpiLink : "upi://pay?pa=xsilica.payu@indus&pn=XSILICA SOFTWARE SOLUTIONS PVT.LTD&tr=13533164083&tid=TID586303PRU210713M11130U6a0cbb0e7c&am=1.00&cu=INR&tn=UPI Transaction for TID586303PRU210713M11130U6a0cbb0e7c"

class PaymentSuccess {
  String? _orderKeyId;
  int? _merchantKeyId;
  String? _uniqueRequestId;
  String? _orderType;
  double? _orderAmount;
  dynamic? _orderId;
  dynamic? _orderStatus;
  int? _orderPaymentStatus;
  dynamic? _orderPaymentStatusText;
  int? _paymentStatus;
  String? _paymentTransactionId;
  int? _paymentResponseCode;
  dynamic? _paymentApprovalCode;
  dynamic? _paymentTransactionRefNo;
  String? _paymentResponseText;
  dynamic? _paymentMethod;
  dynamic? _paymentAccount;
  dynamic? _orderNotes;
  dynamic? _paymentDateTime;
  dynamic? _updatedDateTime;
  String? _paymentProcessUrl;
  OrderPaymentCustomerData? _orderPaymentCustomerData;
  String? _upiLink;

  String? get orderKeyId => _orderKeyId;
  int? get merchantKeyId => _merchantKeyId;
  String? get uniqueRequestId => _uniqueRequestId;
  String? get orderType => _orderType;
  double? get orderAmount => _orderAmount;
  dynamic? get orderId => _orderId;
  dynamic? get orderStatus => _orderStatus;
  int? get orderPaymentStatus => _orderPaymentStatus;
  dynamic? get orderPaymentStatusText => _orderPaymentStatusText;
  int? get paymentStatus => _paymentStatus;
  String? get paymentTransactionId => _paymentTransactionId;
  int? get paymentResponseCode => _paymentResponseCode;
  dynamic? get paymentApprovalCode => _paymentApprovalCode;
  dynamic? get paymentTransactionRefNo => _paymentTransactionRefNo;
  String? get paymentResponseText => _paymentResponseText;
  dynamic? get paymentMethod => _paymentMethod;
  dynamic? get paymentAccount => _paymentAccount;
  dynamic? get orderNotes => _orderNotes;
  dynamic? get paymentDateTime => _paymentDateTime;
  dynamic? get updatedDateTime => _updatedDateTime;
  String? get paymentProcessUrl => _paymentProcessUrl;
  OrderPaymentCustomerData? get orderPaymentCustomerData => _orderPaymentCustomerData;
  String? get upiLink => _upiLink;

  PaymentSuccess({
      String? orderKeyId, 
      int? merchantKeyId, 
      String? uniqueRequestId, 
      String? orderType, 
      double? orderAmount, 
      dynamic? orderId, 
      dynamic? orderStatus, 
      int? orderPaymentStatus, 
      dynamic? orderPaymentStatusText, 
      int? paymentStatus, 
      String? paymentTransactionId, 
      int? paymentResponseCode, 
      dynamic? paymentApprovalCode, 
      dynamic? paymentTransactionRefNo, 
      String? paymentResponseText, 
      dynamic? paymentMethod, 
      dynamic? paymentAccount, 
      dynamic? orderNotes, 
      dynamic? paymentDateTime, 
      dynamic? updatedDateTime, 
      String? paymentProcessUrl, 
      OrderPaymentCustomerData? orderPaymentCustomerData, 
      String? upiLink}){
    _orderKeyId = orderKeyId;
    _merchantKeyId = merchantKeyId;
    _uniqueRequestId = uniqueRequestId;
    _orderType = orderType;
    _orderAmount = orderAmount;
    _orderId = orderId;
    _orderStatus = orderStatus;
    _orderPaymentStatus = orderPaymentStatus;
    _orderPaymentStatusText = orderPaymentStatusText;
    _paymentStatus = paymentStatus;
    _paymentTransactionId = paymentTransactionId;
    _paymentResponseCode = paymentResponseCode;
    _paymentApprovalCode = paymentApprovalCode;
    _paymentTransactionRefNo = paymentTransactionRefNo;
    _paymentResponseText = paymentResponseText;
    _paymentMethod = paymentMethod;
    _paymentAccount = paymentAccount;
    _orderNotes = orderNotes;
    _paymentDateTime = paymentDateTime;
    _updatedDateTime = updatedDateTime;
    _paymentProcessUrl = paymentProcessUrl;
    _orderPaymentCustomerData = orderPaymentCustomerData;
    _upiLink = upiLink;
}

  PaymentSuccess.fromJson(dynamic json) {
    _orderKeyId = json['OrderKeyId'];
    _merchantKeyId = json['MerchantKeyId'];
    _uniqueRequestId = json['UniqueRequestId'];
    _orderType = json['OrderType'];
    _orderAmount = json['OrderAmount'];
    _orderId = json['OrderId'];
    _orderStatus = json['OrderStatus'];
    _orderPaymentStatus = json['OrderPaymentStatus'];
    _orderPaymentStatusText = json['OrderPaymentStatusText'];
    _paymentStatus = json['PaymentStatus'];
    _paymentTransactionId = json['PaymentTransactionId'];
    _paymentResponseCode = json['PaymentResponseCode'];
    _paymentApprovalCode = json['PaymentApprovalCode'];
    _paymentTransactionRefNo = json['PaymentTransactionRefNo'];
    _paymentResponseText = json['PaymentResponseText'];
    _paymentMethod = json['PaymentMethod'];
    _paymentAccount = json['PaymentAccount'];
    _orderNotes = json['OrderNotes'];
    _paymentDateTime = json['PaymentDateTime'];
    _updatedDateTime = json['UpdatedDateTime'];
    _paymentProcessUrl = json['PaymentProcessUrl'];
    _orderPaymentCustomerData = json['OrderPaymentCustomerData'] != null ? OrderPaymentCustomerData.fromJson(json['OrderPaymentCustomerData']) : null;
    _upiLink = json['UpiLink'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['OrderKeyId'] = _orderKeyId;
    map['MerchantKeyId'] = _merchantKeyId;
    map['UniqueRequestId'] = _uniqueRequestId;
    map['OrderType'] = _orderType;
    map['OrderAmount'] = _orderAmount;
    map['OrderId'] = _orderId;
    map['OrderStatus'] = _orderStatus;
    map['OrderPaymentStatus'] = _orderPaymentStatus;
    map['OrderPaymentStatusText'] = _orderPaymentStatusText;
    map['PaymentStatus'] = _paymentStatus;
    map['PaymentTransactionId'] = _paymentTransactionId;
    map['PaymentResponseCode'] = _paymentResponseCode;
    map['PaymentApprovalCode'] = _paymentApprovalCode;
    map['PaymentTransactionRefNo'] = _paymentTransactionRefNo;
    map['PaymentResponseText'] = _paymentResponseText;
    map['PaymentMethod'] = _paymentMethod;
    map['PaymentAccount'] = _paymentAccount;
    map['OrderNotes'] = _orderNotes;
    map['PaymentDateTime'] = _paymentDateTime;
    map['UpdatedDateTime'] = _updatedDateTime;
    map['PaymentProcessUrl'] = _paymentProcessUrl;
    if (_orderPaymentCustomerData != null) {
      map['OrderPaymentCustomerData'] = _orderPaymentCustomerData?.toJson();
    }
    map['UpiLink'] = _upiLink;
    return map;
  }

}

/// FirstName : "ramu"
/// LastName : null
/// Address : null
/// City : null
/// State : null
/// ZipCode : null
/// Country : null
/// MobileNo : "98766543210"
/// Email : "ramu@gmail.com"
/// UserId : null
/// IpAddress : null

class OrderPaymentCustomerData {
  String? _firstName;
  dynamic? _lastName;
  dynamic? _address;
  dynamic? _city;
  dynamic? _state;
  dynamic? _zipCode;
  dynamic? _country;
  String? _mobileNo;
  String? _email;
  dynamic? _userId;
  dynamic? _ipAddress;

  String? get firstName => _firstName;
  dynamic? get lastName => _lastName;
  dynamic? get address => _address;
  dynamic? get city => _city;
  dynamic? get state => _state;
  dynamic? get zipCode => _zipCode;
  dynamic? get country => _country;
  String? get mobileNo => _mobileNo;
  String? get email => _email;
  dynamic? get userId => _userId;
  dynamic? get ipAddress => _ipAddress;

  OrderPaymentCustomerData({
      String? firstName, 
      dynamic? lastName, 
      dynamic? address, 
      dynamic? city, 
      dynamic? state, 
      dynamic? zipCode, 
      dynamic? country, 
      String? mobileNo, 
      String? email, 
      dynamic? userId, 
      dynamic? ipAddress}){
    _firstName = firstName;
    _lastName = lastName;
    _address = address;
    _city = city;
    _state = state;
    _zipCode = zipCode;
    _country = country;
    _mobileNo = mobileNo;
    _email = email;
    _userId = userId;
    _ipAddress = ipAddress;
}

  OrderPaymentCustomerData.fromJson(dynamic json) {
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _address = json['Address'];
    _city = json['City'];
    _state = json['State'];
    _zipCode = json['ZipCode'];
    _country = json['Country'];
    _mobileNo = json['MobileNo'];
    _email = json['Email'];
    _userId = json['UserId'];
    _ipAddress = json['IpAddress'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Address'] = _address;
    map['City'] = _city;
    map['State'] = _state;
    map['ZipCode'] = _zipCode;
    map['Country'] = _country;
    map['MobileNo'] = _mobileNo;
    map['Email'] = _email;
    map['UserId'] = _userId;
    map['IpAddress'] = _ipAddress;
    return map;
  }

}