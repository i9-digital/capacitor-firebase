# @capacitor-firebase/functions

Unofficial Capacitor plugin for [Firebase Functions](https://firebase.google.com/docs/functions).[^1]

## Installation

```bash
npm install @capacitor-firebase/functions firebase
npx cap sync
```

Add Firebase to your project if you haven't already ([Android](https://github.com/capawesome-team/capacitor-firebase/blob/main/docs/firebase-setup.md#android) / [iOS](https://github.com/capawesome-team/capacitor-firebase/blob/main/docs/firebase-setup.md#ios) / [Web](https://github.com/capawesome-team/capacitor-firebase/blob/main/docs/firebase-setup.md#web)).

### Android

#### Variables

This plugin will use the following project variables (defined in your app’s `variables.gradle` file):

- `$firebaseFunctionsVersion` version of `com.google.firebase:firebase-functions` (default: `21.2.2`)

### iOS

Add the `CapacitorFirebaseFunctions/Functions` pod to your `Podfile` (usually `ios/App/Podfile`):

```diff
target 'App' do
capacitor_pods
# Add your Pods here
+  pod 'CapacitorFirebaseFunctions/Functions', :path => '../../node_modules/@capacitor-firebase/functions'
end
```

**Attention**: Do not add the pod in the section `def capacitor_pods`, but under the comment `# Add your Pods here` ([example](https://github.com/robingenz/capacitor-firebase-plugin-demo/blob/e1684a0af6871442ed0a87dceeeba6fd9ce0185d/ios/App/Podfile#L30)).

#### Disable Functions data collection

See [Disable Functions data collection](https://firebase.google.com/docs/functions/configure-data-collection?platform=ios#disable_data_collection) if you want to disable Functions data collection.

#### Disable IDFA collection

If you want to install Firebase without any IDFA collection capability, use the `CapacitorFirebaseFunctions/FunctionsWithoutAdIdSupport` pod in place of the `CapacitorFirebaseFunctions/Functions` pod:

```diff
target 'App' do
capacitor_pods
# Add your Pods here
-  pod 'CapacitorFirebaseFunctions/Functions', :path => '../../node_modules/@capacitor-firebase/functions'
+  pod 'CapacitorFirebaseFunctions/FunctionsWithoutAdIdSupport', :path => '../../node_modules/@capacitor-firebase/functions'
end
```

## Configuration

No configuration required for this plugin.

## Demo

A working example can be found here: [robingenz/capacitor-firebase-plugin-demo](https://github.com/robingenz/capacitor-firebase-plugin-demo)

## Usage

```typescript
import { FirebaseFunctions } from '@capacitor-firebase/functions';

const setUserId = async () => {
  await FirebaseFunctions.setUserId({
    userId: '123',
  });
};

const setUserProperty = async () => {
  await FirebaseFunctions.setUserProperty({
    key: 'language',
    value: 'en',
  });
};

const setCurrentScreen = async () => {
  await FirebaseFunctions.setCurrentScreen({
    screenName: 'Login',
    screenClassOverride: 'LoginPage',
  });
};

const logEvent = async () => {
  await FirebaseFunctions.logEvent({
    name: 'sign_up',
    params: { method: 'password' },
  });
};

const setSessionTimeoutDuration = async () => {
  await FirebaseFunctions.setSessionTimeoutDuration({
    duration: '120',
  });
};

const setEnabled = async () => {
  await FirebaseFunctions.setEnabled({
    enabled: true,
  });
};

const isEnabled = async () => {
  const { enabled } = await FirebaseFunctions.isEnabled();
  return enabled;
};

const resetFunctionsData = async () => {
  await FirebaseFunctions.resetFunctionsData();
};
```

## API

<docgen-index>

* [`httpsCallable(...)`](#httpscallable)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### httpsCallable(...)

```typescript
httpsCallable(options: httpsCallableOptions) => Promise<HttpsCallableResult>
```

Call a callable function.

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code><a href="#httpscallableoptions">httpsCallableOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#httpscallableresult">HttpsCallableResult</a>&gt;</code>

**Since:** 0.1.0

--------------------


### Interfaces


#### HttpsCallableResult

| Prop       | Type             | Description                  | Since |
| ---------- | ---------------- | ---------------------------- | ----- |
| **`data`** | <code>any</code> | Result of the function call. | 0.1.0 |


#### httpsCallableOptions

| Prop       | Type                | Description                      | Since |
| ---------- | ------------------- | -------------------------------- | ----- |
| **`name`** | <code>string</code> | The function bname.              | 0.1.0 |
| **`data`** | <code>object</code> | The data passed to the function. | 0.1.0 |

</docgen-api>

## Test your implementation

[Here](https://firebase.google.com/docs/functions/debugview) you can find more information on how to test the Firebase Functions implementation using the **DebugView**.

## Changelog

See [CHANGELOG.md](https://github.com/capawesome-team/capacitor-firebase/blob/main/packages/functions/CHANGELOG.md).

## License

See [LICENSE](https://github.com/capawesome-team/capacitor-firebase/blob/main/packages/functions/LICENSE).

[^1]: This project is not affiliated with, endorsed by, sponsored by, or approved by Google LLC or any of their affiliates or subsidiaries.
