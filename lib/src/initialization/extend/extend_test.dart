

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/test/screen_tests.dart';
import 'package:afib_signin/src/test/state_tests.dart';
import 'package:afib_signin/src/test/test_data.dart';
import 'package:afib_signin/src/test/unit_tests.dart';
import 'package:afib_signin/src/test/workflow_tests.dart';

void extendTest(AFTestExtensionContext extend) {

    extend.initializeTestFundamentals(
      defineTestData: initTestData,
      defineUnitTests: initUnitTests,
      defineStateTests: initStateTests,
      defineScreenTests: initScreenTests,
      defineWorkflowStateTests: initWorkflowStateTests,
      defineWireframes: null,
    );

}
