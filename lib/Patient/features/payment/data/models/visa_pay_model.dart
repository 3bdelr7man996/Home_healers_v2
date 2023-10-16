class VisaPayModel {
  String? paymentId;
  String? redirectUrl;
  String? html;

  VisaPayModel({this.paymentId, this.redirectUrl, this.html});

  VisaPayModel.fromJson(Map<String, dynamic>? json) {
    paymentId = json?['payment_id'];
    redirectUrl = json?['redirect_url'];
    html = json?['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['redirect_url'] = redirectUrl;
    data['html'] = html;
    return data;
  }
}
