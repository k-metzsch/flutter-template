// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:device_preview/device_preview.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../resource/data/app.dart';
import '../resource/resources.dart';


class ScreenshotGenerator extends StatelessWidget {
  const ScreenshotGenerator({super.key});

  Future<void> saveScreenshotToFirebase(Uint8List screenshotBytes, {required String deviceName}) async {
    final String dateString = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final String fileName = '${deviceName}_$dateString.png';
    final Reference ref = FirebaseStorage.instance.ref().child('screenshots/$fileName');
    final UploadTask uploadTask = ref.putData(screenshotBytes, SettableMetadata(contentType: 'image/png'));

    await uploadTask.whenComplete(() => print(
      'Screenshot for $deviceName saved as $fileName in Firebase Storage.'
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ToolPanelSection(
      title: 'SCREENSHOTS PLUGIN',
      children: <Widget>[
        ListTile(
          title: const Text('Generate'),
          onTap: () async {
            final List<DeviceIdentifier> devices = DevicePreview.availableDeviceIdentifiers(context);

            for (final DeviceIdentifier device in devices) {
              DevicePreview.selectDevice(context, device);
              final DeviceScreenshot result = await DevicePreview.screenshot(context);
              final Uint8List screenshots = Uint8List.fromList(result.bytes);
          
              await saveScreenshotToFirebase(screenshots, deviceName: device.name);
            }
          },
        )
      ],
    );
  }
}



class PreviewApp {
  PreviewApp(Widget appMainProcess) {
    if(AppData.devicePreview) {
      runApp(mainProcessPreviewAttached(appMainProcess));
    } else {
      runApp(appMainProcess);
    }
  }

  DevicePreview mainProcessPreviewAttached(Widget appMainProcess) {
    return DevicePreview(
      builder: (BuildContext context) => appMainProcess,
      tools: const <Widget>[
        ...DevicePreview.defaultTools,
        ScreenshotGenerator(),
      ],
      devices: <DeviceInfo>[
        DeviceInfo.genericPhone(
          platform: TargetPlatform.iOS,
          id: 'ios_phone-5.5"',
          name: 'ios_phone-5.5"',
          screenSize: const Size(621, 1104),
        ),
        DeviceInfo.genericPhone(
          platform: TargetPlatform.iOS,
          id: 'ios_phone-6.5"',
          name: 'ios_phone-6.5"',
          screenSize: const Size(621, 1344),
          safeAreas: const EdgeInsets.only(top: 60),
        ),
        DeviceInfo.genericTablet(
          platform: TargetPlatform.iOS,
          id: 'ios_ipad_2nd-12.9"',
          name: 'ios_ipad_2nd-12.9"',
          screenSize: const Size(1024, 1366),
        ),
        DeviceInfo.genericPhone(
          platform: TargetPlatform.android,
          id: 'google_pixel-6.7"',
          name: 'google_pixel-6.7"',
          screenSize: const Size(720, 1560),
        ),
        DeviceInfo.genericTablet(
          platform: TargetPlatform.android,
          id: 'samsung_galaxy_tab-11"',
          name: 'samsung_galaxy_tab-11"',
          screenSize: const Size(800, 1280),
        ),
      ],
    );
  }
}
