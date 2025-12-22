import 'package:flutter/material.dart';

import 'order_info_item.dart';
import 'payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItem(
          title: "ملخص الطلب",
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                OrderInfoItem(title: "المجموع الفرعي :", price: 150.00),
                OrderInfoItem(title: "التوصيل :", price: 10.00),
                Divider(),
                OrderInfoItem(title: "الكلي", price: 160.00, isTotal: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
