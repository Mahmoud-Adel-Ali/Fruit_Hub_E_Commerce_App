import 'package:flutter/material.dart';

import 'shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          trillingText: '40 جنيه',
          isSelected: true,
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عبر الإنترنت',
          subtitle: 'بطاقة الائتمان أو الخصم',
          trillingText: 'مجاني',
          isSelected: false,
        ),
      ],
    );
  }
}
