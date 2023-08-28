export interface FirebaseFunctionsPlugin {

  /**
   * Call a callable function.
   *
   * @since 0.1.0
   */
  httpsCallable(options: httpsCallableOptions): Promise<HttpsCallableResult>;

}

export interface httpsCallableOptions {
  /**
   * The function bname.
   *
   * @since 0.1.0
   */
  name: string;

  /**
   * The data passed to the function.
   *
   * @since 0.1.0
   */
  data?: object;
}

/**
 * @since 0.1.0
 */
export interface HttpsCallableResult {
  /**
   * Result of the function call.
   *
   * @since 0.1.0
   */
  data: any;
}