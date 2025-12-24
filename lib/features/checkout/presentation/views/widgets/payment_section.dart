import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
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
        const SizedBox(height: 16.0),
        PaymentItem(
          title: 'عنوان التوصيل',
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Icon(Icons.location_on_outlined, color: AppColors.grey),
              const SizedBox(width: 8.0),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.grey.shade500,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  "تعديل",
                  style: AppTextStyles.bold13.copyWith(color: AppColors.grey),
                ),
                icon: Icon(
                  Icons.edit_outlined,
                  size: 16.0,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
