package io.capawesome.capacitorjs.plugins.firebase.functions;

import android.content.Context;

import com.getcapacitor.Bridge;
import com.getcapacitor.JSObject;
import com.getcapacitor.PluginCall;

import org.json.JSONObject;

public class FirebaseFunctions {

    private com.google.firebase.functions.FirebaseFunctions functionsInstance = null;

    public FirebaseFunctions(Context context, Bridge bridge) {
        this.functionsInstance = com.google.firebase.functions.FirebaseFunctions.getInstance();
    }

    public void httpsCallable(PluginCall call) {
        String name = call.getString("name");
        JSONObject data = call.getObject("data");
        this.functionsInstance.getHttpsCallable(name).call(data)
        .addOnCompleteListener(task -> {
            if (task.isSuccessful()) {
                JSObject result = new JSObject();
                result.put("data", task.getResult().getData());
                call.resolve(result);
            } else {
                Exception e = task.getException();
                call.reject(e.getMessage(), e);
            }
        });
    }
}
