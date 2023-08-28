package io.capawesome.capacitorjs.plugins.firebase.functions;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "FirebaseFunctions")
public class FirebaseFunctionsPlugin extends Plugin {

    private FirebaseFunctions implementation;

    public void load() {
        implementation = new FirebaseFunctions(this.getContext(), this.getBridge());
    }

   @PluginMethod
    public void httpsCallable(PluginCall call) {
        try {
           implementation.httpsCallable(call);
        } catch (Exception e) {
            call.reject(e.getMessage(), e);
        }
    }
}
