import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:monitorflutter/app/routes/app_pages.dart';
import 'package:monitorflutter/app/theme/my_icon.dart';
import 'package:monitorflutter/app/theme/my_scaffold_dashboard.dart';
import 'package:monitorflutter/app/utils/fdottedline.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

class EmptyDashboardPage extends StatelessWidget {
  final title = GlobalVariables.TEXT_DASHBOARD;
  @override
  Widget build(BuildContext context) {
    return MyScaffoldDashboard(
      bodyFunction: bodyFunction,
      title: title,
      icon: iconPlus,
      floatingActionButton: () {
        Get.offAndToNamed(Routes.ADD_MONITOR);
      },
    );
  }

  bodyFunction() {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              GlobalVariables.DASHBOARD_LABEL_EMPTY_SERVICE,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffA2BAC4),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: FDottedLine(
                    width: 0,
                    height: 0,
                    color: Color(0xff658998),
                    strokeWidth: 2.0,
                    dottedLength: 8.0,
                    space: 3.0,
                    corner: FDottedLineCorner.all(6.0),

                    /// add widget
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.ADD_SERVICE),
                      child: Container(
                        color: Color(0xff325360),
                        width: double.infinity,
                        height: 110,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              GlobalVariables.DASHBOARD_SERVICE_CREATE,
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xffA2BAC4)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              FontAwesome.plus_circle,
                              size: 36,
                              color: Color(0xff658998),
                            ),
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
