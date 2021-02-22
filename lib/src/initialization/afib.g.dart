// File last generated at 2021-02-22 17:52:15.836425 on Chriss-iMac-Pro.jh
import 'package:afib/afib_command.dart';
void configureAfib(AFConfig config) {
  // --environment         
  //       [debug]         For debugging
  //       [production]    For production
  //       [prototype]     Interact with prototype screens, and run tests against them on the simulator
  //       [test]          Used internally when command-line tests are executing, not usually explicitly used by developers
  config.setValue("environment", AFEnvironment.prototype);
  
  // --logs-enabled       
  //       [af:config]    Logging on any non-test definition/initialization context, and of afib.g.dart/startup configuration values
  //       [af:query]     Internal AFib logging for queries
  //       [af:route]     Internal AFib logging related to apps and navigation
  //       [af:state]     Internal AFib logging related to app state
  //       [af:test]      Internal AFib logging for testing
  //       [af:theme]     Internal AFib logging related to theming
  //       [af:ui]        Internal AFib logging for UI build
  //       [none]         Turn off all logging
  //       [query]        App logging on AFStartQueryContext, AFFinishQuerySuccessContext or AFFinishQueryErrorContext
  //       [standard]     Logging for app query and ui, plus afib route and state
  //       [test]         App logging on test definition contexts and all test execution contexts
  //       [ui]           App logging on any AFBuildContext
  config.setValue("logs-enabled", []);
  
  // --force-dark-mode    Set to true if you'd like to run the app in dark mode, regardless of the device setting
  //                      [true, false]
  config.setValue("force-dark-mode", false);
  
  // --tests-enabled     
  //       [*]           Or, the full identifier of any prototype, test name, or tag
  //       [all]         All tests, not including i18n and regression
  //       [i18n]        
  //       [screen]      
  //       [state]       State tests
  //       [unit]        
  //       [widget]      
  //       [workflow]    
  config.setValue("tests-enabled", []);
  
  // --test-size                The size used for command line tests, often used in conjunction with test-orientation
  // 
  //       [*]                  Or, [width]x[height], e.g. 1000x2000
  //       [phone-large]        1284.0 x 2778.0
  //       [phone-standard]     1170.0 x 2532.0
  //       [tablet-large]       2048.0 x 2732.0
  //       [tablet-small]       1536.0 x 2048.0
  //       [tablet-standard]    1640.0 x 2360.0
  config.setValue("test-size", "phone-standard");
  
  // --test-orientation    The orientation used in command line tests
  // 
  //       [landscape]     Landscape, width larger than height
  //       [portrait]      Portrait, height larger than width
  config.setValue("test-orientation", "portrait");
  
  // --app-namespace    A short identifier which is unique to your app, many files and classes are prefixed with these characters, so changing it later is not advised
  config.setValue("app-namespace", "afsi");
  
  // --afsi_special_config    sample configuration value
  //                          [true, false]
  config.setValue("afsi_special_config", false);
  
  // --widgetTesterContext    Internal value set to true when we are doing widget tests
  //                          [true, false]
  config.setValue("widgetTesterContext", false);
  
}

