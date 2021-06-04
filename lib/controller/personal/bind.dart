import 'package:get/get.dart';
import 'package:school_planner/controller/personal/controller.dart';

class SchoolPlannerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolController>(() => SchoolController());
  }
}
