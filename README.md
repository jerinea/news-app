# README #

This README would normally document whatever steps are necessary to get your application up and running.

### Requirements ###

* Xcode 14
* Swift 5
* Minimum supported iOS version 12.0
* Git

### How to set up the project ###

* Clone the repository
* Open `NewsApp.xcodeproj`

### Run Application ###

* Set the active schema and select the Simulator
* Run by clicking on the run button or Select `Run` from `Product` menu

### Run Tests ###

* Run the test by selecting `Product` > `Test`
* See the report by opening `Report navigator` in left pane.

### Code Coverage ###

* Enable code coverage gathering by selecting `Code Coverage` from Edit scheme > Test > Options
* Run the test by selecting `Product` > `Test`
* See the coverage report by opening `Report navigator` in left pane and select `Coverage`

### UI Test ###
* Enable UI Test by enabling `NewsAppUITests` from Edit scheme > Test > Info
* Run the test by selecting `Product` > `Test`
* See the coverage report by opening `Report navigator` in left pane.

## Application Architecture ##

News App project utlizes MVC(Model View Controller) architecture.  This project also uses singleton and delegation design patterns to achieve some features.

### Project Structure ###

This project is structured in a such a way that the UI elements are properly decoupled
* Configurations - Xcode configurations and struct to load the configurations.
* Model - hold the model structs and classes
* Network - Holds the classes and protocols required for network operation and api calls.
* Service - Layer which creates the Api request and pass it to the network layer.
* Screens - All UI elements - UIViewControllers, UIViews, Cells etc
* Storyboards - Holds the storyboards

### Project Configruation ###

This project uses XCode configruation settings file to keep the configruations such as api base url and api key.
Struct `Environment` is used for accessing the configurations.
* `Debug.xcconfig` - Keep development/test configruations
* `Release.xcconfig` - Keep development/test configruations

### Network ###

This project uses URLSession to call apis and JSONDecoder to decode json response from api to Decaodable models. `APIClient` singleton class accepts the API request (Eg:  `GetNews`) wihch confirms to the `APIRequest` protocol. Decode the api response based on the `SuccessResponseType` defined in the API request.

### Screens ###

This project uses Storyboard and UIKit framework to implement the UI/Screens. SwiftUI is not used in order to support iOS versions below 13. Naviation is based on UINavigationController using storyboard segues.
Following are the clases uses to implement UI.
* `NewsListViewController`: First screen where all news/articles are listed.
* `NewsDetailViewController`: Screen which display the details of a particular news/article.
* `PeriodSelectionViewController`: Model screen to select the period from which the news/articles are fetched.
* `LazyImageView`: UIImageView subclass which load image from url and display.
* `ImageCache`: Cache the image loaded from url in a singleton NSCache object.
