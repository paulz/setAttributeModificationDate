# Demonstration of a potential iOS SDK bug
## Set url resource attribute modification date

See included Xcode playground where setting NSURL attribute modification date fails: [demo.playground](demo.playground)

NSURLAttributeModificationDateKey is a read-write attribute according to the documentation:
See https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/doc/constant_group/Common_File_System_Resource_Keys
