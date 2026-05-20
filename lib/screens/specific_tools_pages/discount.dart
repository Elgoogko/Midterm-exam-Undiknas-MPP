import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/components/common_app_bar.dart';
import 'package:basic_app/providers/discount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiscountProvider>();

    String originalPrice = provider.originalPriceString;
    String discountPercentage = provider.discountPercentageString;
    String finalResult = provider.finalResult.toStringAsFixed(2);
    String savedAmount = provider.savedAmount.toStringAsFixed(2);

    double screenShortest = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      appBar: CommonAppBar(title: 'Discount Calculator'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              // ← Expanded donne une hauteur au scroll
              padding: EdgeInsets.symmetric(
                horizontal: screenShortest * 0.1,
                vertical: 16,
              ),
              child: Column(
                children: [
                  _buildSelectableRow(
                    context: context,
                    label: 'Original Price',
                    value: originalPrice,
                    isActive: provider.inputType == 'originalPrice',
                    onTap: () => provider.switchInputType('originalPrice'),
                  ),
                  const SizedBox(height: 12),
                  _buildSelectableRow(
                    context: context,
                    label: 'Discount',
                    value: '$discountPercentage%',
                    isActive: provider.inputType == 'discountPercentage',
                    onTap: () => provider.switchInputType('discountPercentage'),
                  ),
                  const Divider(height: 30, thickness: 1),
                  _buildRow(context, 'Final price', '$finalResult €'),
                  const SizedBox(height: 8),
                  Text(
                    'You saved: $savedAmount €',
                    style: TextStyle(
                      fontSize: (screenShortest * 0.045).clamp(12, 24),
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ChoosePad(
              type: 'discount',
              onButtonTap: (btnText) =>
                  context.read<DiscountProvider>().handleTap(btnText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableRow({
    required BuildContext context,
    required String label,
    required String value,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    double screenShortest = MediaQuery.of(context).size.shortestSide;

    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive
              ? primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border.all(
            color: isActive ? primaryColor : Colors.grey.withValues(alpha: 0.3),
            width: isActive ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenShortest * 0.04,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? primaryColor : null,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: screenShortest * 0.045,
                fontWeight: FontWeight.bold,
                color: isActive ? primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRow(BuildContext context, String rText, String lText) {
    double screenShortest = MediaQuery.of(context).size.shortestSide;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rText,
          style: TextStyle(
            fontSize: screenShortest * 0.04,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            child: Text(
              lText,
              style: TextStyle(
                fontSize: screenShortest * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
