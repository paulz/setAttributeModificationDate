//: ## Demonstrate setResourceValue with NSURLAttributeModificationDateKey fails
//:


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
