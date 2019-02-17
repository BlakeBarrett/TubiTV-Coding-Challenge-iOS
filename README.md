# Tubi TV iOS Engineer Coding Challenge 

## Project Overview: 
Given an endpoint that returns a list of assets in JSON format, create a native iOS app that displays returned data in a collection view. The collection view should be searchable. When the user taps on one of the collection view cells, the app should play the video associated with that cell. 

## Time Estimate: 
This is intended to be a simple project which should take a few hours to complete. If you find yourself spending more than that, feel free to cut down on scope or reach out for clarification. That said, we want to see your best work, so if you need the extra time for a stronger solution, use it. We’d much rather see a well organized solution that took 4 hours, than the quick solution that could be done in 2. 

## API Endpoint: 
Please use the tenor.com API, found here: https://tenor.com/gifapi/documentation 
Here is an example query, you might need to register for your own API Key: https://api.tenor.com/v1/search?q=cool&key=LIVDSRZULELA&limit=8&anon_id=3a76e56901d740da9e59ffb22b988242 

## Feature Requirements:
 * Fetch endpoint data, display it in a collection view
 * Search bar that updates the collection view as the user types 
 * Tapping on a collection view cell causes the app to start playing the video 
 * Display correctly on iPhone & iPad in all 4 orientations 
 * Unit tests 
 
## Programming Language/SDK Usage: 
 * To show knowledge of both Swift and Objective C, please write the collection view class in Swift and the video player class in Objective C 
 * Native iOS UIKit (storyboard, auto layout, size classes) 
 * Ok to use third-party networking frameworks like Alamofire/SDWebImage 
 
## Grading: 
 * Code quality, cleanness, and reusability 
 * Error handling, and edge case scenario fallback design 
 * Overall code architecture design and extendibility 
 
## Project Submission: 
Please submit the source code in a zip file and maintain Xcode project structure. The project should be able to unzip and be able to run without any structural integrity issues. 
