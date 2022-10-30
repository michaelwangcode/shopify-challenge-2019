# Shopify iOS Developer Intern Challenge 2019

## About

This was the iOS Developer Intern Challenge that got me an interview with Shopify in 2019.

Applicants were asked to create an iOS app that displays a sorted list of products from JSON data.

The original URL containing the JSON data for the products is no longer available, but I thought ahead and saved a copy within the project.

Fortunately, the product image URLs (displayed as coloured robots) are still accessible.


## Screenshots

The first page displays a list of all product tags in alphabetical order.

Clicking an individual tag will take you to a page of that product type, complete with image.

!["Screenshot"](https://raw.githubusercontent.com/michaelwangcode/shopify-challenge-2019/master/screenshots/screenshot.png)


## Assignment

### Problem

You're a successful Shopify merchant with many products in your store! You’d like an easier way of browsing your products from your phone based on the “tags” on each product. Create an iOS app that displays a ​Tags List Page​ and a ​Products List Page​. Your app will need to fetch data from the ​Shopify Products REST API​.

### Tags List Page: ​

A simple list of every unique tag that has been added to one of your products (e.g. Aerodynamic, Clock, Concrete). Clicking on a tag launches the Products List Page.

### Products List Page: 

​A list of every product that contains the selected tag. Each row in the list needs to contain, at a minimum, the name of the product and the total available inventory across all variants of the product.

Note that the ​API link​ is only for the first page of orders (for this challenge you can ignore any additional pages). Here are a couple simple libraries that you can use to fetch the data (these are optional, you can pick one or use any other alternative).

iOS: https://github.com/Alamofire/Alamofire/

or just use URLSession

### Extra

Feeling adventurous? Show the product image for each row of the ​Products List Page

What you need to submit:

1. A screenshot of your app showing the ​Tags List Page

2. A screenshot of your app showing the ​Products List Page ​after clicking on
“Aerodynamic” from the Tags List Page

3. Your project code.

