# React native opentok

This opentok library for react native is a 90% rewrite of an initial version of callstack.io
This library gives all control to starting / stopping / publishing etc to react native
So all logic for the app can be built in react native.

React Native Opentok module as used in Mindd applications. 
Supports one on one calls including receiving screen shares and rotation during call.

In order for rotation support during the call in IOS add this to AppDelegate:

`#import <react-native-opentok/RCTOpenTokSessionManager.h>`

`-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
  return [RCTOpenTokSessionManager orientation];
}`
