class OrderDetailResponse {
  int? _merchantKeyId;
  int? _orderAmount;
  dynamic? _orderId;
  String? _orderKeyId;
  String? _orderNotes;
  dynamic? _orderPaymentCustomerData;
  int? _orderPaymentStatus;
  dynamic? _orderPaymentStatusText;
  List<dynamic>? _orderPaymentTransactionDetail;
  String? _orderStatus;
  String? _orderType;
  String? _paymentAccount;
  String? _paymentApprovalCode;
  String? _paymentDateTime;
  String? _paymentMethod;
  dynamic? _paymentProcessUrl;
  int? _paymentResponseCode;
  String? _paymentResponseText;
  int? _paymentStatus;
  String? _paymentTransactionId;
  String? _paymentTransactionRefNo;
  String? _uniqueRequestId;
  String? _updatedDateTime;
  dynamic? _upiLink;
  dynamic? _userDefinedData;

  int? get merchantKeyId => _merchantKeyId;
  int? get orderAmount => _orderAmount;
  dynamic? get orderId => _orderId;
  String? get orderKeyId => _orderKeyId;
  String? get orderNotes => _orderNotes;
  dynamic? get orderPaymentCustomerData => _orderPaymentCustomerData;
  int? get orderPaymentStatus => _orderPaymentStatus;
  dynamic? get orderPaymentStatusText => _orderPaymentStatusText;
  List<dynamic>? get orderPaymentTransactionDetail => _orderPaymentTransactionDetail;
  String? get orderStatus => _orderStatus;
  String? get orderType => _orderType;
  String? get paymentAccount => _paymentAccount;
  String? get paymentApprovalCode => _paymentApprovalCode;
  String? get paymentDateTime => _paymentDateTime;
  String? get paymentMethod => _paymentMethod;
  dynamic? get paymentProcessUrl => _paymentProcessUrl;
  int? get paymentResponseCode => _paymentResponseCode;
  String? get paymentResponseText => _paymentResponseText;
  int? get paymentStatus => _paymentStatus;
  String? get paymentTransactionId => _paymentTransactionId;
  String? get paymentTransactionRefNo => _paymentTransactionRefNo;
  String? get uniqueRequestId => _uniqueRequestId;
  String? get updatedDateTime => _updatedDateTime;
  dynamic? get upiLink => _upiLink;
  dynamic? get userDefinedData => _userDefinedData;

  OrderDetailResponse({
      int? merchantKeyId, 
      int? orderAmount, 
      dynamic? orderId, 
      String? orderKeyId, 
      String? orderNotes, 
      dynamic? orderPaymentCustomerData, 
      int? orderPaymentStatus, 
      dynamic? orderPaymentStatusText, 
      List<dynamic>? orderPaymentTransactionDetail, 
      String? orderStatus, 
      String? orderType, 
      String? paymentAccount, 
      String? paymentApprovalCode, 
      String? paymentDateTime, 
      String? paymentMethod, 
      dynamic? paymentProcessUrl, 
      int? paymentResponseCode, 
      String? paymentResponseText, 
      int? paymentStatus, 
      String? paymentTransactionId, 
      String? paymentTransactionRefNo, 
      String? uniqueRequestId, 
      String? updatedDateTime, 
      dynamic? upiLink, 
      dynamic? userDefinedData}){
    _merchantKeyId = merchantKeyId;
    _orderAmount = orderAmount;
    _orderId = orderId;
    _orderKeyId = orderKeyId;
    _orderNotes = orderNotes;
    _orderPaymentCustomerData = orderPaymentCustomerData;
    _orderPaymentStatus = orderPaymentStatus;
    _orderPaymentStatusText = orderPaymentStatusText;
    _orderPaymentTransactionDetail = orderPaymentTransactionDetail;
    _orderStatus = orderStatus;
    _orderType = orderType;
    _paymentAccount = paymentAccount;
    _paymentApprovalCode = paymentApprovalCode;
    _paymentDateTime = paymentDateTime;
    _paymentMethod = paymentMethod;
    _paymentProcessUrl = paymentProcessUrl;
    _paymentResponseCode = paymentResponseCode;
    _paymentResponseText = paymentResponseText;
    _paymentStatus = paymentStatus;
    _paymentTransactionId = paymentTransactionId;
    _paymentTransactionRefNo = paymentTransactionRefNo;
    _uniqueRequestId = uniqueRequestId;
    _updatedDateTime = updatedDateTime;
    _upiLink = upiLink;
    _userDefinedData = userDefinedData;
}

  OrderDetailResponse.fromJson(dynamic json) {
    _merchantKeyId = json['MerchantKeyId'];
    _orderAmount = json['OrderAmount'];
    _orderId = json['OrderId'];
    _orderKeyId = json['OrderKeyId'];
    _orderNotes = json['OrderNotes'];
    _orderPaymentCustomerData = json['OrderPaymentCustomerData'];
    _orderPaymentStatus = json['OrderPaymentStatus'];
    _orderPaymentStatusText = json['OrderPaymentStatusText'];
    _orderPaymentTransactionDetail = json['OrderPaymentTransactionDetail'];
    _orderStatus = json['OrderStatus'];
    _orderType = json['OrderType'];
    _paymentAccount = json['PaymentAccount'];
    _paymentApprovalCode = json['PaymentApprovalCode'];
    _paymentDateTime = json['PaymentDateTime'];
    _paymentMethod = json['PaymentMethod'];
    _paymentProcessUrl = json['PaymentProcessUrl'];
    _paymentResponseCode = json['PaymentResponseCode'];
    _paymentResponseText = json['PaymentResponseText'];
    _paymentStatus = json['PaymentStatus'];
    _paymentTransactionId = json['PaymentTransactionId'];
    _paymentTransactionRefNo = json['PaymentTransactionRefNo'];
    _uniqueRequestId = json['UniqueRequestId'];
    _updatedDateTime = json['UpdatedDateTime'];
    _upiLink = json['UpiLink'];
    _userDefinedData = json['UserDefinedData'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['MerchantKeyId'] = _merchantKeyId;
    map['OrderAmount'] = _orderAmount;
    map['OrderId'] = _orderId;
    map['OrderKeyId'] = _orderKeyId;
    map['OrderNotes'] = _orderNotes;
    map['OrderPaymentCustomerData'] = _orderPaymentCustomerData;
    map['OrderPaymentStatus'] = _orderPaymentStatus;
    map['OrderPaymentStatusText'] = _orderPaymentStatusText;
    if (_orderPaymentTransactionDetail != null) {
      map['OrderPaymentTransactionDetail'] = _orderPaymentTransactionDetail?.map((v) => v.toJson()).toList();
    }
    map['OrderStatus'] = _orderStatus;
    map['OrderType'] = _orderType;
    map['PaymentAccount'] = _paymentAccount;
    map['PaymentApprovalCode'] = _paymentApprovalCode;
    map['PaymentDateTime'] = _paymentDateTime;
    map['PaymentMethod'] = _paymentMethod;
    map['PaymentProcessUrl'] = _paymentProcessUrl;
    map['PaymentResponseCode'] = _paymentResponseCode;
    map['PaymentResponseText'] = _paymentResponseText;
    map['PaymentStatus'] = _paymentStatus;
    map['PaymentTransactionId'] = _paymentTransactionId;
    map['PaymentTransactionRefNo'] = _paymentTransactionRefNo;
    map['UniqueRequestId'] = _uniqueRequestId;
    map['UpdatedDateTime'] = _updatedDateTime;
    map['UpiLink'] = _upiLink;
    map['UserDefinedData'] = _userDefinedData;
    return map;
  }

}