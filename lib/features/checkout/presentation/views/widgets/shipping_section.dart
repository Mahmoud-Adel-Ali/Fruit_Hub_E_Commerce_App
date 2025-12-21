import 'package:flutter/material.dart';

import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  bool _isCashOnDeliverySelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          trillingText: '40 جنيه',
          isSelected: _isCashOnDeliverySelected,
          onTap: () {
            _isCashOnDeliverySelected = true;
            setState(() {});
          },
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عبر الإنترنت',
          subtitle: 'بطاقة الائتمان أو الخصم',
          trillingText: '40 جنيه',
          // trillingText: 'مجاني',
          isSelected: !_isCashOnDeliverySelected,
          onTap: () {
            _isCashOnDeliverySelected = false;
            setState(() {});
          },
        ),
      ],
    );
  }
}
