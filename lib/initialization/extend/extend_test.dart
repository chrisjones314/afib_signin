

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/test/screen_tests.dart';
import 'package:afib_signin/test/state_tests.dart';
import 'package:afib_signin/test/test_data.dart';
import 'package:afib_signin/test/unit_tests.dart';
import 'package:afib_signin/test/widget_tests.dart';
import 'package:afib_signin/test/workflow_tests.dart';

void extendTest(AFTestExtensionContext extend) {

    extend.initializeTestFundamentals(
      initTestData: initTestData,
      initUnitTests: initUnitTests,
      initStateTests: initStateTests,
      initWidgetTests: initWidgetTests,
      initScreenTests: initScreenTests,
      initWorkflowStateTests: initWorkflowStateTests
    );

}
