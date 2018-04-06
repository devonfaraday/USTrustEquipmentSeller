//
//  String+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

extension String {
    
    
    /* Cell Identifiers */
    static var imageCellIdentifierKey: String { get { return "imageCell" } }
    static var listingCellIdentifierKey: String { get { return "listingCell" } }
    
    /* Date Converter */
    func toDate() -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = String.dateAndTimeFormateForSortingKey
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = String.dateAndTimeFormateForSortingKey
        guard let date = dateFormatterGet.date(from: self) else { return Date() }
        let createdString = dateFormatter.string(from: date)
        guard let newDate = dateFormatter.date(from: createdString) else { return Date() }
        return newDate
    }
    
    /* Date Formatting Keys */
    
    static var dateAndTimeFormatKey: String { get { return "MM/dd/yyyy hh:mm a" } }
    static var dateAndTimeFormateForSortingKey: String { get { return "MM/dd/yyyy hh:mm:ss a" } }
    static var dateFormatKey: String { get { return "MM/dd/yyyy" } }
    static var timeFormatKey: String { get { return "hh:mm a" } }
    static var timeFormatForSortingKey: String { get { return "hh:mm:ss a" } }
    
    /* Firebase Endpoints*/
    static var companiesEndpoint: String { get { return "companies" } }
    static var imagesEndpointKey: String { get { return "images" } }
    static var listingsEndpoint: String { get { return "listings" } }
    static var profileImagesEndpointKey: String { get { return "profileImages" } }
    static var storesEndpoint: String { get { return "stores" } }
    static var usersEndpoint: String { get { return "users" } }
    
    /*  Model Keys */
    static var administratorAccountKey: String { get { return "administratorAccount" } }
    static var authorizedBuyersKey: String { get { return "authorizedBuyers" } }
    static var authorizedSellersKey: String { get { return "authorizedSellers" } }
    static var cityKey: String { get { return "city" } }
    static var companyNameKey: String { get { return "companyName" } }
    static var companyReferenceKey: String { get { return "companyReference" } }
    static var companyWatchListKey: String { get { return "companyWatchList" } }
    static var emailKey: String { get { return "email" } }
    static var einNumberKey: String { get { return "einNumber" } }
    static var firstNameKey: String { get { return "firstName" } }
    static var identifierKey: String { get { return "uid" } }
    static var isBannedKey: String { get { return "isBanned" } }
    static var isVerifiedKey: String { get { return "isVerified" } }
    static var lastNameKey: String { get { return "lastName" } }
    static var logoKey: String { get { return "logo" } }
    static var profileImageKey: String { get { return "profileImage" } }
    static var phoneKey: String { get { return "phoneNumber" } }
    static var ratingKey: String { get { return "rating" } }
    static var stateKey: String { get { return "state" } }
    static var streetAddressKey: String { get { return "streetAddress" } }
    static var zipCodeKey: String { get { return "zipCode" } }
    static var administratorAccountsIdentifierKey: String { get { return "administratorAccountsIdentifiers" } }
    static var authorizedSellersIdentifierKey: String { get { return "authorizedSellersIdentifiers" } }
    static var authorizedBuyersIdentifierKey: String { get { return "authorizedBuyersIdentifiers" } }
    static var itemNameKey: String { get { return "itemName" } }
    static var quantityKey: String { get { return "quantity" } }
    static var catagoryIdentifierKey: String { get { return "catagoryIdentifier" } }
    static var descriptionKey: String { get { return "description" } }
    static var priceKey: String { get { return "price" } }
    static var locationKey: String { get { return "location" } }
    static var imageKey: String { get { return "image" } }
    static var companyIdentifierKey: String { get { return "companyIdentifier" } }
    static var createdKey: String { get { return "created" } }
    static var storeNameKey: String { get { return "storeName" } }
    static var storeTypeKey: String { get { return "storeType" } }
    static var listingsIdentifiersKey: String { get { return "listingsIdentifiers" } }
    static var storeOwnerIdentifierKey: String { get { return "storeOwnerIdentifier" } }
    static var usernameKey: String { get { return "username" } }
    static var listingWatchListKey: String { get { return "listingWatchList" } }
    static var imageURLsKey: String { get { return "imageURLReferences" } }
    static var logoImageReferenceKey: String { get { return "logoImageReference" } }
    static var updatedKey: String { get { return "updated" } }
    
    /* Notification Names */
    static var companyCreationDidFinishNotificationNameKey: String { get { return "companyCreationDidFinish" } }
    
    /* Segues */
    static var listingPreferenceButtonsEmbededSegueKey: String { get { return "preferenceButtons" } }
    static var toCreateListingFullSegueKey: String { get { return "createListingFull" } }
    static var toCreateListingNameSegueKey: String { get { return "createListingName" } }
    static var toCreateCompanyNavigationControllerSegueKey: String { get { return "toCreateCompanyNavigationController" } }
    static var toCompanyNameViewControllerSegueKey: String { get { return "toCompanyNameViewController" } }
    static var toCompanyAddressViewControllerSegueKey: String { get { return "toCompanyAddressViewController" } }
    static var toCompanyPhoneNumberViewControllerSegueKey: String { get { return "toCompanyPhoneNumberViewController" } }
    static var toCompanyEINViewControllerSegueKey: String { get { return "toCompanyEINViewController" } }
    static var toCompanyLogoViewControllerSegueKey: String { get { return "toCompanyLogoViewController" } }
    static var toCompanyCompletionViewControllerSegueKey: String { get { return "toCompanyCompletionViewController" } }
    static var toUserProfileSegueKey: String { get { return "toUserProfile" } }
    static var toLoginSegueKey: String { get { return "toLogin" } }
    static var toUsernamePasswordCreationSegueKey: String { get { return "toUsernamePasswordCreation" } }
    
    /* Storyboard Identifiers */
    static var browseListingsStoryboardIdentifier: String { get { return "BrowseListingsViewController" } }
    static var CompanyCreationNavigationStoryboardIdentifier: String { get { return "CompanyCreationNavigationController" } }
    static var companyProfileStoryboardIdentifier: String { get { return "CompanyProfileViewController" } }
    static var createListingStoryboardIdentifier: String { get { return "CreateListingViewController" } }
    static var initialStoryboardIdentifier: String { get { return "InitialViewController" } }
    static var listingDetailStoryboardIdentifier: String { get { return "ListingDetailViewController" } }
    static var loginStoryboardIdentifier: String { get { return "LoginViewController" } }
    static var signUpStoryboardIdentifier: String { get { return "SignUpViewController" } }
    static var storyProfileStoryboardIdentifier: String  { get { return "StoryProfileViewController" } }
    static var userProfileStoryboardIdentifier: String { get { return "UserProfileViewController" } }
    
    /* Storyboard Names */
    static var createCompanyNavigationStoryboardNameKey: String { get { return "CreateCompany" } }
    static var companyProfileStoryboardNameKey: String { get { return "CompanyProfile" } }
    static var userProfileStoryboardNameKey: String { get { return "UserProfile" } }
}
