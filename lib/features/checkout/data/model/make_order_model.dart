class MakeOrderModel {
  final double totalPrice;
  final String paymentType;
  final String address;
  final String orderTime;
  final List<CheckoutOrders> checkoutOrders;

  MakeOrderModel({
    required this.totalPrice,
    required this.checkoutOrders,
    required this.paymentType,
    required this.address,
    required this.orderTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'order_total_price': totalPrice,
      'payment_type': paymentType,
      'address': address,
      'delivery_time': orderTime,
      'products': checkoutOrders.map((e) => e.toJson()).toList(),
    };
  }
}

class CheckoutOrders {
  final int prodId;
  final int quantity;
  final double price;

  CheckoutOrders({
    required this.prodId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': prodId,
      'quantity': quantity,
      'price': price,
    };
  }
}
