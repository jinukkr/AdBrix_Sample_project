//
//  ViewController.swift
//  AdBrixSampleProject_ios
//
//  Created by Jin-uk Park on 2021/03/09.
//

import UIKit
import AdBrixRM

class ViewController: UIViewController {
    
    let adBrix = AdBrixRM.getInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        adBrix.event(eventName: "MainView")
    }

    @IBAction func customEvent(_ sender: Any) {
        
        adBrix.event(eventName: "myCustomEvent_ios")
        
    }
    
    @IBAction func goToDeeplinkView(_ sender: Any) {
        
        let deeplinkView = self.storyboard?.instantiateViewController(identifier: "DeeplinkView")
        deeplinkView?.modalTransitionStyle = .coverVertical
        self.present(deeplinkView!, animated: true, completion: nil)
    }
    
    
    @IBAction func samplePurchse(_ sender: Any) {
         
        let productModel1 =  adBrix.createCommerceProductDataWithAttr(
                    productId: "productID_1",
                    productName: "상품명 1",
                    price: 12500.00,
                    quantity: 1,
                    discount: 2500.00,
                    currencyString: adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.KRW.rawValue),
                    category: adBrix.createCommerceProductCategoryData(category: "컴퓨터", category2: "PC", category3: "cd-rom", category4: "software", category5: "game"),
                    productAttrsMap: nil)


          // 상품 정보 모델 Array 생성
          var arr : Array<AdBrixRmCommerceProductModel> = Array()
          arr.append(productModel1)

          //상품 결제 - 모바일 결제
          adBrix.commonPurchaseWithAttr(orderId: "orderid_1",
                                        productInfo: arr,
                                        orderSales: 70000.00,
                                        discount: 1500.00,
                                        deliveryCharge: 2500.00,
                                        paymentMethod: AdBrixRM.AdbrixRmPaymentMethod.CreditCard,
                                        orderAttr: nil)

        
    }
}

