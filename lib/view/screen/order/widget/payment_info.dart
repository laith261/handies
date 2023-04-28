import 'package:flutter/material.dart';
import 'package:handies/localization/language_constrants.dart';
import 'package:handies/provider/order_provider.dart';
import 'package:handies/provider/profile_provider.dart';
import 'package:handies/utill/color_resources.dart';
import 'package:handies/utill/custom_themes.dart';
import 'package:handies/utill/dimensions.dart';
import 'package:handies/view/screen/payment/payment_screen.dart';
import 'package:provider/provider.dart';

class PaymentInfo extends StatelessWidget {
  final OrderProvider order;
  const PaymentInfo({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(color: Theme.of(context).highlightColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(getTranslated('PAYMENT', context), style: robotoBold),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(getTranslated('PAYMENT_STATUS', context),
                style: titilliumRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL)),
            Text(
              (order.trackingModel.paymentStatus != null &&
                      order.trackingModel.paymentStatus.isNotEmpty)
                  ? order.trackingModel.paymentStatus
                  : 'Digital Payment',
              style: titilliumRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL),
            ),
          ]),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(getTranslated('PAYMENT_PLATFORM', context),
              style: titilliumRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL)),
          Text(
              order.trackingModel.paymentMethod != null
                  ? getTranslated(order.trackingModel.paymentMethod, context)
                  : '',
              style: titilliumBold.copyWith(
                color: Theme.of(context).primaryColor,
              )),
        ]),
      ]),
    );
  }
}
