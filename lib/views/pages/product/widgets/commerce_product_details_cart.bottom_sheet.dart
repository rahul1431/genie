import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/utils/utils.dart';
import 'package:fuodz/view_models/product_details.vm.dart';
import 'package:fuodz/widgets/buttons/custom_button.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';

class CommerceProductDetailsCartBottomSheet extends StatelessWidget {
  const CommerceProductDetailsCartBottomSheet({this.model, Key key})
      : super(key: key);

  final ProductDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        //
        Visibility(
          visible: model.product.hasStock,
          child: HStack(
            [
              //add t cart
              CustomButton(
                loading: model.isBusy,
                child: "Add to cart"
                    .tr()
                    .text
                    .color(Utils.textColorByTheme())
                    .semiBold
                    .make()
                    .p12(),
                onPressed: model.addToCart,
              ).expand(),
              UiSpacer.smHorizontalSpace(),
              //buy now
              CustomButton(
                color: AppColor.primaryColorDark,
                loading: model.isBusy,
                child: "Buy Now"
                    .tr()
                    .text
                    .color(Utils.textColorByTheme())
                    .semiBold
                    .make()
                    .p12(),
                onPressed: model.buyNow,
              ).expand(),
            ],
          ).p12(),
        ),

        Visibility(
          visible: !model.product.hasStock,
          child: "No stock"
              .tr()
              .text
              .white
              .makeCentered()
              .p8()
              .box
              .red500
              .roundedSM
              .make()
              .p8()
              .wFull(context),
        ),
      ],
    ).box.color(context.backgroundColor).shadowXl.make().wFull(context);
  }
}
