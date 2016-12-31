// https://github.com/Quick/Quick

import Quick
import Nimble
import EasyDefaults

struct  MWebSettings{
  static var baseFont = Default<String>("baseFont", defaultValue:"Menlo")
  static var baseFontSize = Default<Int>("baseFontSize", defaultValue:15)
  static var lineSpacing = Default<Int>("lineSpacing", defaultValue: 1)
  static var transNewLinesToBR = Default<Bool>("transNewLinesToBR", defaultValue: true)
  static var enableTOC = Default<Bool>("enableTOC", defaultValue: false)
  static var autoScrollingThresholdPercent = Default<Double>("autoScrollingThresholdPercent", defaultValue: 60.0)
  static var someThresholdPercent = Default<Float>("someThresholdPercent", defaultValue: 50.0)
}

struct SystemDefaultValue{
  static let noDefaultInt = Default<Int>("noDefaultInt")
  static let noDefaultBool = Default<Bool>("noDefaultInt")
  static let noDefaultDouble = Default<Double>("noDefaultInt")
}

struct OptionalSettings{
  static var avatarUrl = Default<URL>("avatar")
  static var favoriteFruits = Default<[String]>("favoriteFruits")
  static var favoriteNumbers = Default<[Int]>("favoriteNumbers")
  static var secretData = Default<Data>("secretData")
  static var lastUpdateDate = Default<Date>("lastUpdateDate")
  static var cloudApiInfo = Default<[String:String]>("cloudApiInfo")
}

struct OtherSettings{
  static var dateArray = Default<[Date]>("dateArray")
  static var dataArray = Default<[Data]>("dataArray")
  static var importNamedDate = Default<[String:Date]>("importNamedDate")
  static var cachedData = Default<[String:Data]>("cachedData")
}



class DefaultsSpec: QuickSpec{
  
  let testSuiteName = "com.banxi1988.test-suite"
  override func spec() {
    //    UserDefaults.resetStandardUserDefaults()
    
    describe("Defaults") {
      it("can read default value"){
        expect(MWebSettings.baseFont.optionalValue)  == "Menlo"
        expect(MWebSettings.baseFontSize.value)  == 15
        expect(MWebSettings.enableTOC.value)  == false
        expect(MWebSettings.transNewLinesToBR.value) == true
      }
      
      it("can read system default value"){
        expect(SystemDefaultValue.noDefaultInt.value) == 0
        expect(SystemDefaultValue.noDefaultBool.value) == false
        expect(SystemDefaultValue.noDefaultDouble.value) == 0.0
      }
      
      it("can read write Int type"){
        MWebSettings.lineSpacing.value = 2
        expect(MWebSettings.lineSpacing.value) == 2
        expect(MWebSettings.lineSpacing.optionalValue) == 2
        
        MWebSettings.lineSpacing.optionalValue = 3
        expect(MWebSettings.lineSpacing.value) == 3
        expect(MWebSettings.lineSpacing.optionalValue) == 3
        
        MWebSettings.lineSpacing.optionalValue = nil
        expect(MWebSettings.lineSpacing.value) == 0
        expect(MWebSettings.lineSpacing.optionalValue) == 0
        
      }
      
      it("can read write Bool type"){
        MWebSettings.enableTOC.value = true
        expect(MWebSettings.enableTOC.value) == true
        expect(MWebSettings.enableTOC.optionalValue) == true
        
        MWebSettings.enableTOC.optionalValue = false
        expect(MWebSettings.enableTOC.value) == false
        expect(MWebSettings.enableTOC.optionalValue) == false
        
        MWebSettings.enableTOC.optionalValue = nil
        expect(MWebSettings.enableTOC.value) == false
        expect(MWebSettings.enableTOC.optionalValue) == false
      }
      
      it("can read write Double type"){
        MWebSettings.autoScrollingThresholdPercent.value = 50
        expect(MWebSettings.autoScrollingThresholdPercent.value) == 50
        expect(MWebSettings.autoScrollingThresholdPercent.optionalValue) == 50
        
        MWebSettings.autoScrollingThresholdPercent.optionalValue = 30
        expect(MWebSettings.autoScrollingThresholdPercent.value) == 30
        expect(MWebSettings.autoScrollingThresholdPercent.optionalValue) == 30
        
        MWebSettings.autoScrollingThresholdPercent.optionalValue = nil
        expect(MWebSettings.autoScrollingThresholdPercent.value) == 0
        expect(MWebSettings.autoScrollingThresholdPercent.optionalValue) == 0
      }
      
      it("can read write Float type"){
        MWebSettings.someThresholdPercent.value = 50
        expect(MWebSettings.someThresholdPercent.value) == 50
        expect(MWebSettings.someThresholdPercent.optionalValue) == 50
        
        MWebSettings.someThresholdPercent.optionalValue = 70
        expect(MWebSettings.someThresholdPercent.value) == 70
        expect(MWebSettings.someThresholdPercent.optionalValue) == 70
        
        MWebSettings.someThresholdPercent.optionalValue = nil
        expect(MWebSettings.someThresholdPercent.value) == 0
        expect(MWebSettings.someThresholdPercent.optionalValue) == 0
        
      }
      
      it("can read write URL type"){
        OptionalSettings.avatarUrl.optionalValue = nil
        expect(OptionalSettings.avatarUrl.optionalValue).to(beNil())
        let avatarUrl = URL(string: "http://banxi1988.com")
        OptionalSettings.avatarUrl.optionalValue = avatarUrl
        expect(OptionalSettings.avatarUrl.optionalValue) == avatarUrl
        expect(OptionalSettings.avatarUrl.value) == avatarUrl
      }
      
      it("can read write Int Array type"){
        OptionalSettings.favoriteNumbers.optionalValue = nil
        expect(OptionalSettings.favoriteNumbers.optionalValue).to(beNil())
        
        let favoriteNumbers = [1,3,5,7,9]
        OptionalSettings.favoriteNumbers.value = favoriteNumbers
        expect(OptionalSettings.favoriteNumbers.optionalValue) == favoriteNumbers
        expect(OptionalSettings.favoriteNumbers.value) == favoriteNumbers
        
        let someNumbers = [2,4,6]
        OptionalSettings.favoriteNumbers.optionalValue = someNumbers
        expect(OptionalSettings.favoriteNumbers.optionalValue) == someNumbers
        expect(OptionalSettings.favoriteNumbers.value) == someNumbers
        
      }
      
      it("can read write String Array type"){
        OptionalSettings.favoriteFruits.optionalValue = nil
        expect(OptionalSettings.favoriteFruits.optionalValue).to(beNil())
        let favoriteFruits = ["Banana","Orange", "Apple"]
        OptionalSettings.favoriteFruits.value = favoriteFruits
        expect(OptionalSettings.favoriteFruits.optionalValue) == favoriteFruits
        expect(OptionalSettings.favoriteFruits.value) == favoriteFruits
      }
      
      it("can read Date Array type"){
        
      }
      
      it("can read write Data type"){
        OptionalSettings.secretData.optionalValue = nil
        let rdata = OptionalSettings.secretData.optionalValue
        expect(rdata).to(beNil())
        
        var seedData = Data()
        seedData.append(64)
        
        OptionalSettings.secretData.value = seedData
        expect(OptionalSettings.secretData.value) == seedData
        expect(OptionalSettings.secretData.optionalValue) == seedData
        
        seedData.append(65)
        OptionalSettings.secretData.optionalValue = seedData
        expect(OptionalSettings.secretData.value) == seedData
        expect(OptionalSettings.secretData.optionalValue) == seedData
        
        OptionalSettings.secretData.optionalValue = nil
        expect(OptionalSettings.secretData.optionalValue).to(beNil())
        
      }
      
      it("can read write Date type"){
        OptionalSettings.lastUpdateDate.optionalValue = nil
        expect(OptionalSettings.lastUpdateDate.optionalValue).to(beNil())
        
        let now = Date()
        OptionalSettings.lastUpdateDate.value = now
        expect(OptionalSettings.lastUpdateDate.optionalValue) == now
        expect(OptionalSettings.lastUpdateDate.value) == now
        
        let now2 =  Date()
        OptionalSettings.lastUpdateDate.optionalValue = now2
        expect(OptionalSettings.lastUpdateDate.optionalValue) == now2
        expect(OptionalSettings.lastUpdateDate.value) == now2
        
      }
      
      it("can read write dict type"){
        OptionalSettings.cloudApiInfo.optionalValue = nil
        expect(OptionalSettings.cloudApiInfo.optionalValue).to(beNil())
        
        let dict: [String:String] = [
          "name": "BDN",
          "ip": "127.0.0.1"
        ]
        
        OptionalSettings.cloudApiInfo.value = dict
        expect(OptionalSettings.cloudApiInfo.value) == dict
        expect(OptionalSettings.cloudApiInfo.optionalValue) == dict
        
        let dict2: [String:String] = [
          "name": "CDN",
          "ip": "192.168.0.1"
        ]
        OptionalSettings.cloudApiInfo.optionalValue = dict2
        expect(OptionalSettings.cloudApiInfo.value) == dict2
        expect(OptionalSettings.cloudApiInfo.optionalValue) == dict2
        
      }
      
    }
    
    describe("Other Settings"){
      it("Support Date Array"){
        let dates = [Date(), Date()]
        OtherSettings.dateArray.value = dates
        expect(OtherSettings.dateArray.value) == dates
      }
      
      it("Support Data Array"){
        let datas = [Data(bytes:[1]), Data(bytes:[2,3]), Data(bytes:[3,4])]
        OtherSettings.dataArray.value = datas
        expect(OtherSettings.dataArray.value) == datas
      }
      
      it("Support str date map"){
        let dateMap:[String:Date] = [
          "birthday": Date(),
          "weddingday": Date()
        ]
        
        OtherSettings.importNamedDate.value = dateMap
        expect(OtherSettings.importNamedDate.value) == dateMap
      }
      
      it("Support str data map"){
        let cacheMap: [String:Data] = [
          "img1": Data(bytes: [1,3,5]),
          "img2": Data(bytes: [2,4,6])
        ]
        
        OtherSettings.cachedData.value = cacheMap
        expect(OtherSettings.cachedData.value) == cacheMap
      }
    }
  }
}
