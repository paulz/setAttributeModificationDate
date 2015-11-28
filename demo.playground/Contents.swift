//: ## Demonstrate setResourceValue with NSURLAttributeModificationDateKey fails
//:
//: According to the [NSURL documentation](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/doc/constant_group/Common_File_System_Resource_Keys) NSURLAttributeModificationDateKey is a read-write
//:
//: `NSURLAttributeModificationDateKey`
//:
//: The time at which the resource’s attributes were most recently modified, returned as an NSDate object if the volume supports attribute modification dates, or nil if attribute modification dates are unsupported **(read-write)**.


import Foundation

//: create a file
let fileUrl = NSURL.fileURLWithPath(NSTemporaryDirectory() + "a file")
try "text".writeToURL(fileUrl, atomically: true, encoding: NSASCIIStringEncoding)

//: set attribute modification date
let referenceDate = NSDate(timeIntervalSinceReferenceDate: 0)
try fileUrl.setResourceValue(referenceDate, forKey: NSURLAttributeModificationDateKey)

//: get attribute modification date
var resourceValue: AnyObject?
try fileUrl.getResourceValue(&resourceValue, forKey: NSURLAttributeModificationDateKey)

//: surprisingly the date we get back is not the one we set, but the current date
var attributeModificationDate  = resourceValue as! NSDate
assert(attributeModificationDate.isEqualToDate(referenceDate), "should equal to reference date")
