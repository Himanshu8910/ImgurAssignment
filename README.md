# ImgurAssignment

**Features:**

1. Supports both iPhones and iPad.
2. Application has been developed on Xcode version 10.2.1 with Swift 5 Language.
3. Application uses only one third party Library **SDWebImage** which has been installed through CocoaPods.
4. Documentation.



**Requirements:**

- Xcode 10.2.1
- Mac OS version 10.14.5

Since the app uses CocoaPods, Make sure you have [cocoaPods](https://cocoapods.org/) installed on the system.
While running the application, if you face any error like “SDWebImage not found”, follow the steps below.

1. Open terminal and go to the project root folder and run the following command.
   
   “Pod install”
   
2. If the error is not resolved, delete Podfile.lock file from the project root folder and then repeat step 1.


**How to run:**

Open the project root folder and click on the **ImgurGalleryAssignment.xcworkspace**. It will open the xcode.
Choose the iPhone simulator on which you want to run the application.
Click on the run button to run the application on the simulator.


**Functionality:**

1. On launch of the application, it fetches the weekly top images from the Imgur Gallery. 
2. Pull to refresh feature has been added. Pull down the table to fetch the updates.
3. User has been provided the ability to input text as part of the search query  
4. Toggle feature is provided to filter the images.
5. App has been tested with Unit test cases.
6) Supports error handling.
 

