import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trafficlightsiot/controllers/home_controller.dart';
import 'package:trafficlightsiot/resources/app_colors.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cruce peatonal'),
        backgroundColor: AppColors.SURFACE_COLOR,
        foregroundColor: AppColors.ONSURFACE_COLOR,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.STATUS_BAR_COLOR),
        elevation: 3,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 40,
            ),
            child: Obx(
              () => Text(
                c.isWaiting.value
                    ? 'walkerSubtitleHelperOnWaiting'.tr
                    : c.isGreen.value
                        ? 'walkerSubtitleHelperOnStop'.tr
                        : c.isYellow.value
                            ? 'walkerSubtitleHelperOnWarning'.tr
                            : 'walkerSubtitleHelperOnGo'.tr,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.SECONDARY_TEXT,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width / 20,
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Obx(
              () => Container(
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.width - 60,
                decoration: new BoxDecoration(
                  color: c.isGreen.value
                      ? AppColors.CRITICAL_COLOR
                      : c.isYellow.value
                          ? AppColors.WARNING_COLOR
                          : AppColors.SUCCESS_COLOR,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: c.isGreen.value
                      ? const EdgeInsets.only(right: 30)
                      : EdgeInsets.zero,
                  child: Icon(
                    c.isGreen.value
                        ? Icons.pan_tool_rounded
                        : c.isYellow.value
                            ? Icons.warning_rounded
                            : Icons.directions_walk_rounded,
                    color: AppColors.DARK_PRIMARY_TEXT,
                    size: MediaQuery.of(context).size.width / 3,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Obx(
              () => MaterialButton(
                onPressed: c.isGreen.value
                    ? c.isWaiting.value
                        ? null
                        : () => c.publishRequestStop()
                    : null,
                height: 50,
                minWidth: MediaQuery.of(context).size.width - 40,
                elevation: 3,
                color: AppColors.INTERACTIVE_COLOR,
                disabledColor: AppColors.DISABLED_BUTTON,
                disabledTextColor: AppColors.DISABLED_TEXT,
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  'primaryButtonText'.tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
