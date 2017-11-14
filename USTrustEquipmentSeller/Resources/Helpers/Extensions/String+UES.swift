//
//  String+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

extension String {
    
    /* Firebase Endpoints*/
    static var companiesEndpoint: String { get { return "companies" } }
    static var listingsEndpoint: String { get { return "listings" } }
    static var storesEndpoint: String { get { return "stores" } }
    static var usersEndpoint: String { get { return "users" } }
    
    /*  Model Keys */
    static var administratorAccountKey: String { get { return "administratorAccount" } }
    static var authorizedBuyersKey: String { get { return "authorizedBuyers" } }
    static var authorizedSellersKey: String { get { return "authorizedSellers" } }
    static var cityKey: String { get { return "city" } }
    static var companyNameKey: String { get { return "companyName" } }
    static var emailAddressKey: String { get { return "emailAddress" } }
    static var einNumberKey: String { get { return "einNumber" } }
    static var firstNameKey: String { get { return "firstName" } }
    static var identifierKey: String { get { return "uid" } }
    static var isBannedKey: String { get { return "isBanned" } }
    static var isVerifiedKey: String { get { return "isVerified" } }
    static var lastNameKey: String { get { return "lastName" } }
    static var logoKey: String { get { return "logo" } }
    static var profileImageKey: String { get { return "profileImage" } }
    static var phoneKey: String { get { return "phone" } }
    static var ratingKey: String { get { return "rating" } }
    static var stateKey: String { get { return "state" } }
    static var streetAddressKey: String { get { return "streetAddress" } }
    static var zipCodeKey: String { get { return "zipCode" } }
    
    /* Storyboard Identifiers */
    static var browseListingsStoryboardIdentifier: String { get { return "BrowseListingsViewController" } }
    static var companyProfileStoryboardIdentifier: String { get { return "CompanyProfileViewController" } }
    static var createListingStoryboardIdentifier: String { get { return "CreateListingViewController" } }
    static var initialStoryboardIdentifier: String { get { return "InitialViewController" } }
    static var listingDetailStoryboardIdentifier: String { get { return "ListingDetailViewController" } }
    static var loginStoryboardIdentifier: String { get { return "LoginViewController" } }
    static var signUpStoryboardIdentifier: String { get { return "SignUpViewController" } }
    static var storyProfileStoryboardIdentifier: String  { get { return "StoryProfileViewController" } }
    static var userProfileStoryboardIdentifier: String { get { return "UserProfileViewController" } }
}
