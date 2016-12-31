import Foundation

public var userDefaults = UserDefaults.standard


/// A Mordern ,Safe, Easy, Swifty way to access your UserDefaults
/// 1) the Generic T only support PropertyList Support Type, `Int`,`Bool`,`Double`,`Float`,`NSNumber`,`String`,`,URL`,`Data`,`Date` etc.
/// see code for more list
public struct Default<T>{
  public let key:String
  public let defaultValue: T?
  
  private func assertType(){
    let type = T.self
    if type == Int.self
      || type == Bool.self
      || type == Double.self
      || type == Float.self
      || type == NSNumber.self
      || type == String.self
      || type == URL.self
      || type == Data.self
      || type == Date.self
      || type == [Int].self
      || type == [Bool].self
      || type == [Double].self
      || type == [Float].self
      || type == [NSNumber].self
      || type == [String].self
      || type == [Data].self
      || type == [Date].self
      || type == [String:Int].self
      || type == [String:Bool].self
      || type == [String:Double].self
      || type == [String:Float].self
      || type == [String:NSNumber].self
      || type == [String:String].self
      || type == [String:Data].self
      || type == [String:Date].self{
      
    }else{
      fatalError("UnpportedType")
    }
  }
  
  
  /// Construct a Default entry
  ///
  /// - Parameters:
  ///   - key: defaultName for UserDefaults
  ///   - defaultValue: default Value for UserDefaults
  public init(_ key:String, defaultValue:T? = nil){
    self.key = key
    self.defaultValue = defaultValue
    assertType()
    if let defaultValue = defaultValue{
      userDefaults.register(defaults: [key:defaultValue])
    }
  }
  
  
  ///
  /// as a getter,return a non optional value.
  /// if the stored value is nil,and data type is  not `Int`, `Bool`,`Double`, `Float`
  /// it will crash your app. so for other data types use `optionalValue` instead
  /// as a setter, any supported value are welcome.
  public var value:T{
    get{
      let type = T.self
      if type == Int.self{
        return userDefaults.integer(forKey: key) as! T
      }else if type == Bool.self{
        return userDefaults.bool(forKey: key) as! T
      }else if type == Double.self{
        return userDefaults.double(forKey: key) as! T
      }else if type == Float.self{
        return userDefaults.float(forKey: key) as! T
      }else{
        return optionalValue!
      }
    }set{
      optionalValue = newValue
    }
  }
  
  
  /// as a getter, return the stored value. **Note**, as for `Int`, `Bool`,`Double`
  /// and `Float` types, It always return non optional values. read more for the `UserDefaults` related getter methods
  ///
  public var optionalValue:T?{
    get{
      let type = T.self
      if type == Int.self{
        return userDefaults.integer(forKey: key) as? T
      }else if type == Bool.self{
        return userDefaults.bool(forKey: key) as? T
      }else if type == Double.self{
        return userDefaults.double(forKey: key) as? T
      }else if type == Float.self{
        return userDefaults.float(forKey: key) as? T
      }else if type == String.self{
        return userDefaults.string(forKey: key) as? T
      }else if type == [String].self{
        return userDefaults.stringArray(forKey: key) as? T
      }else if type == Data.self{
        return userDefaults.data(forKey: key) as? T
      }else if type == URL.self{
        return userDefaults.url(forKey: key) as? T
      }else{
        return userDefaults.object(forKey: key) as? T
      }
    }set{
      if let value = newValue{
        let type = T.self
        if type == URL.self{
          userDefaults.set((value as! URL), forKey: key)
        }else if type == Bool.self{
          userDefaults.set((value as! Bool), forKey: key)
        }else if type == Int.self{
          userDefaults.set((value as! Int), forKey: key)
        }else if type == Float.self{
          userDefaults.set((value as! Float), forKey: key)
        }else if type == Double.self{
          userDefaults.set((value as! Double), forKey: key)
        }else{
          userDefaults.set(value, forKey: key)
        }
      }else{
        if T.self == Data.self{
          userDefaults.removeObject(forKey: key)
        }else{
          userDefaults.set(nil, forKey: key)
        }
      }
    }
  }
}


