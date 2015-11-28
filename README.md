# Demonstration of a potential iOS SDK bug
## Set value for NSURLAttributeModificationDateKey fails

See included Xcode playground where setting NSURL attribute modification date fails: [demo.playground](demo.playground)

## NSURLAttributeModificationDateKey
NSURLAttributeModificationDateKey is a read-write attribute according to the documentation:
See https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/doc/constant_group/Common_File_System_Resource_Keys

### Example

```swift
//: set attribute modification date
let referenceDate = NSDate(timeIntervalSinceReferenceDate: 0)
try fileUrl.setResourceValue(referenceDate, forKey: NSURLAttributeModificationDateKey)

//: get attribute modification date
var resourceValue: AnyObject?
try fileUrl.getResourceValue(&resourceValue, forKey: NSURLAttributeModificationDateKey)

//: surprisingly the date we get back is not the one we set, but the current date
var attributeModificationDate  = resourceValue as! NSDate
assert(attributeModificationDate.isEqualToDate(referenceDate), "should equal to reference date")
```
