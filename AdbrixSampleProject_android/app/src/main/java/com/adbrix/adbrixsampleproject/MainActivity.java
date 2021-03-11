package com.adbrix.adbrixsampleproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.igaworks.v2.core.AdBrixRm;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements AdBrixRm.DeferredDeeplinkListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        AdBrixRm.setDeferredDeeplinkListener(MainActivity.this);

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

        setIntent(intent);
        AdBrixRm.deeplinkEvent(MainActivity.this);

        Uri myDeeplink = intent.getData();

        if (myDeeplink != null){

            // Deeplink string
            Log.d("igaworks" ,"Deeplink Value ::::::" + myDeeplink.toString());
        }



    }

    void sampleCustomEvent () {

        AdBrixRm.event("myCustomEvent");

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



    }

    @Override
    public void onReceiveDeferredDeeplink(String deeplink) {

        // Deferred Deeplink String
        Log.d("igaworks", "DeferredDeeplink_String :::::::::" + deeplink);

    }
}