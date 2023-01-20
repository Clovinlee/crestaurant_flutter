class Cart {
  int id = -1;
  late int foodId;
  late int qty;
  late double subtotal;

  Cart({
    required this.id,
    required this.foodId,
    required this.qty,
    required this.subtotal,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    qty = json['qty'];
    subtotal = double.parse(json['subtotal']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['food_id'] = this.foodId;
    data['qty'] = this.qty;
    data['subtotal'] = this.subtotal;
    return data;
  }
}
