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
        
        let attrModel = AdBrixRmAttrModel()
             attrModel.setAttrDataString("gender", "male")
             attrModel.setAttrDataInt("age", 36)
        
        adBrix.eventWithAttr(eventName: "myCustomEvent_ios", value: attrModel)
        
    }
    
    @IBAction func userProperty(_ sender: Any) {
    
        // User Age
        adBrix.setAge(int: 30)

        // User Gender
        adBrix.setGender(adBrixGenderType: AdBrixRM.AdBrixGenderType.Male)

        // Extra User Information
        let attrModel = AdBrixRmAttrModel()
        attrModel.setAttrDataString("school", "highschool")
        attrModel.setAttrDataInt("height", 36)
        attrModel.setAttrDataBool("married", true)
        
        adBrix.setUserPropertiesWithAttr(attrModel: attrModel)
    
    }
    
    
    
    @IBAction func goToDeeplinkView(_ sender: Any) {
        
        if let appURL = URL(string: "https://3rvJ2x4r7Uieu9BC1hq8fQ.adtouch.adbrix.io/api/v1/click/60UdGCWcIUKlPwmZ6FkzDg?deeplink_custom_path=peterworks%3A%2F%2Fmain%3Fpage%3Ddeeplink_open&m_adgroup=igawadgroup&m_creative=igaw_creative&cb_3=igaw_itesmid&cb_1=igaw_reqid&cb_2=igaw_uid&cb_4=igaw_imp_time&cb_5=igaw_igatime"){
            UIApplication.shared.open(appURL){ success in
                if success{
                    
                    let deeplinkView = self.storyboard?.instantiateViewController(identifier: "DeeplinkView")
                    deeplinkView?.modalTransitionStyle = .coverVertical
                    self.present(deeplinkView!, animated: true, completion: nil)
                    
                }else{
                    
                }
            }
        }
        

    }
    
    @IBAction func gotoDeeplinkschem(_ sender: Any) {
        

        let appURL = URL(string: "https://3rvJ2x4r7Uieu9BC1hq8fQ.adtouch.adbrix.io/api/v1/click/60UdGCWcIUKlPwmZ6FkzDg?deeplink_custom_path=peterworks%3A%2F%2Fmain%3Fpage%3Ddeeplink_open&m_adgroup=igawadgroup&m_creative=igaw_creative&cb_3=igaw_itesmid&cb_1=igaw_reqid&cb_2=igaw_uid&cb_4=igaw_imp_time&cb_5=igaw_igatime")
        
        adBrix.deepLinkOpen(url: appURL!)
                    
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

        let attrModel = AdBrixRmAttrModel()
             attrModel.setAttrDataString("gender", "male")
             attrModel.setAttrDataInt("age", 36)

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
                                        orderAttr: attrModel)
        
        
    }
}

