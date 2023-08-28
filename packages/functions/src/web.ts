import { WebPlugin } from '@capacitor/core';

import type {
  FirebaseFunctionsPlugin,
  HttpsCallableResult,
} from './definitions';

export class FirebaseFunctionsWeb
  extends WebPlugin
  implements FirebaseFunctionsPlugin
{
  httpsCallable(): Promise<HttpsCallableResult> {
    throw new Error('Method not implemented on web.');
  }
}
