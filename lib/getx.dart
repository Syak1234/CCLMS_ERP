import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:open_file/open_file.dart';

import 'class/feesdetails.dart';
import 'class/intalldetails.dart';

class Getx extends GetxController {
  RxInt totalpayment = 0.obs;
  RxInt receivedpayment = 0.obs;
  RxList<FeesInfo> fdetail = <FeesInfo>[].obs;
  RxList<InstallDetails> details = <InstallDetails>[].obs;
  RxBool visibility = false.obs;
  RxBool show = true.obs;
  RxBool visible = false.obs;
  RxBool login = false.obs;
  RxBool togglebuttonValue = false.obs;
  RxBool nodata = false.obs;
  RxInt data = 0.obs;
  RxBool finger = false.obs;
  late RxBool canCheckBiometrics;
  late RxBool? canbeCheckBiometrics;
  RxList<BiometricType>? availableBiometrics;
  RxString authorized = 'Not Authorized'.obs;
  RxBool isAuthenticating = false.obs;
   fingercheck(value) {
   return finger.value = value;
  }

  RxList<String> extension = ['pdf', 'doc', 'docx'].obs;
  RxString notallowextension = ''.obs;
  final showfile = PlatformFile(name: '', size: 0).obs;
  RxBool s = false.obs;

  void pickCvFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        // dialogTitle: 'File',

        allowedExtensions: extension,
      );
      if (result == null) return;

      final file = result.files.first;
      if (extension.contains(file.extension)) {
        showfile.value = file;
        s.value = true;
      } else {
        s.value = false;
        notallowextension.value = "Only .docx .pdf .doc files are allowed";
      }
    } catch (e) {
      print(e);
    }
  }

  void openFile(PlatformFile file) {
    try {
      OpenFile.open(file.path);
    } catch (e) {}
  }

  void toggleButtonChange(a) {
    togglebuttonValue.value = a;
  }

  void isvalid(bool bool) {
    show.value = bool;
  }

  void visibile(a, b) {
    visible.value = a;
    login.value = b;
  }

  visibilitycheck() {
    visibility.value = !visibility.value;
  }
}
