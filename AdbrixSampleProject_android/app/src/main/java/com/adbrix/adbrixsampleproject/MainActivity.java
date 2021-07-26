package com.adbrix.adbrixsampleproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.igaworks.v2.core.AdBrixRm;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements AdBrixRm.DeferredDeeplinkListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // This is Custom event that tracking MainActivity is opened
        AdBrixRm.event("main_view_open");

        // Set DeferredDeeplink Linstner for get DeferredDeeplink String Data from AdBrix Server
        AdBrixRm.setDeferredDeeplinkListener(MainActivity.this);

        AdBrixRm.onResume(this);
        AdBrixRm.onPause();

        // onNewIntent Method will process every deeplink data.
        onNewIntent(MainActivity.this.getIntent());

        findViewById(R.id.button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sampleCustomEvent();
            }
        });

        findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                samplePurchaseEvent();
            }
        });

    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);

        // setIntent should be called for get new deeplink data. If this is not called, always same deeplink will called
        setIntent(intent);

        // AdBrix deeplink tracking API. Remember. This api only tracks the deeplink open event. It will not do process deeplink.
        AdBrixRm.deeplinkEvent(MainActivity.this);

        // Deeplink data process start
        Uri myDeeplink = intent.getData();

        if (myDeeplink != null){

            // User Android Applink process.
            if(myDeeplink.getScheme().equals("https")) {

                Log.d("igaworks", "Android Applink Open :::::::::" + myDeeplink.toString());
                Toast toast = Toast.makeText(this.getApplicationContext(),"Android Applink Open :::::::::" + myDeeplink.toString(), Toast.LENGTH_LONG);
                toast.show();

                // Frist decode Applink data contain deeplink data on deeplink_custom_path.
                String urlDecode = Uri.decode(myDeeplink.toString());

                Uri myApplink = Uri.parse(urlDecode);

                try {
                    // Get deeplink parameter from Applink's deeplink_custom_path
                    String getDeeplinkValue = myApplink.getQueryParameter("deeplink_custom_path");

                   // Parsing the deeplink data string to URL
                    Uri myDeeplinkPath = Uri.parse(getDeeplinkValue);

                    // Get deeplink path value --> adbrixrm://open?page=deeplink_open
                    String pageName = myDeeplinkPath.getQueryParameter("page");

                    if (pageName.equals("deeplink_open")){
                        startActivity(new Intent( this, DeeplinkOpenActivity.class));
                    }
                } catch (NullPointerException e) {

                }
             // use Deeplink Scheme
            } else {

                Log.d("igaworks", "Android Deeplink Open :::::::::" + myDeeplink.toString());
                Toast toast = Toast.makeText(this.getApplicationContext(),"Android Deeplink Open :::::::::" + myDeeplink.toString(), Toast.LENGTH_LONG);
                toast.show();

                try {

                    String pageName = myDeeplink.getQueryParameter("page");

                    if (pageName.equals("deeplink_open")){
                        startActivity(new Intent( this, DeeplinkOpenActivity.class));
                    }

                } catch (NullPointerException e) {

                }

            }

        }

    }

    void sampleCustomEvent () {

        AdBrixRm.event("myCustomEvent");

        Toast toast = Toast.makeText(this.getApplicationContext(),"AdBrix Custom Event Called" , Toast.LENGTH_LONG);
        toast.show();

    }

    void samplePurchaseEvent () {

        AdBrixRm.CommerceProductModel sampleProduct = new AdBrixRm.CommerceProductModel()
                .setProductID("sampleProductID")
                .setProductName("sampleProductName")
                .setPrice(20000.00)
                .setDiscount(0.00)
                .setCurrency(AdBrixRm.Currency.KR_KRW)
                .setCategory(new AdBrixRm.CommerceCategoriesModel().setCategory("myfirstCategory"));

        ArrayList productModelArrayList = new ArrayList<>();
        productModelArrayList.add(sampleProduct);

        AdBrixRm.Common.purchase("myOrderID", productModelArrayList,0.0,2500.00, AdBrixRm.CommercePaymentMethod.MobilePayment);

        Toast toast = Toast.makeText(this.getApplicationContext(),"AdBrix Purchase Event Called" , Toast.LENGTH_LONG);
        toast.show();

    }

    @Override
    public void onReceiveDeferredDeeplink(String deferredDeeplink) {

        // Deferred Deeplink String
        Log.d("igaworks", "AdBrix DeferredDeeplink Open :::::::::" + deferredDeeplink);

        // set deferredDeeplink String to Uri
        Uri myDeferredDeeplink = Uri.parse(deferredDeeplink);

        try {

            String pageName = myDeferredDeeplink.getQueryParameter("page");

            if (pageName.equals("deeplink_open")){
                startActivity(new Intent( this, DeeplinkOpenActivity.class));
            }

        } catch (NullPointerException e) {

        }



    }
}