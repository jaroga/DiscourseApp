//
//  CategoriesResponse.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation

// MARK: - CategoryDetailResponse
struct CategoryDetailResponse: Codable {
    let categoryDetail: CategoryDetail
    
    enum CodingKeys: String, CodingKey {
        case categoryDetail = "category"
    }
}

// MARK: - CategoryDetail
struct CategoryDetail: Codable {
    let id: Int
    let name: String
    let color: String
    let textColor: String
    let slug: String
//    let topicCount: Int
//    let postCount: Int
//    let position: Int
//    let description: String
//    let descriptionText: String
//    let topicUrl: String?
//    let readRestricted: Bool
//    let permission: Int
//    let notificationLevel: Int
//    let topicTemplate: String?
//    let hasChildren: Bool
//    let sortOrder: String?
//    let sortAscending: String?
//    let showSubcategoryList: Bool
//    let numFeaturedTopics: Int
//    let defaultView: String?
//    let subcategoryListStyle: String?
//    let defaultTopPeriod: String?
//    let minimumRequiredTags: Int
//    let navigateToFirstPostAfterRead: Bool
//    let topicsDay: Int
//    let topicsWeek: Int
//    let topicsMonth: Int
//    let topicsYear: Int
//    let topicsAllTime: Int
//    let descriptionExcerpt: String
//    let isUncategorized: Bool?
//    let uploadedLogo: String?
//    let uploadedBackground: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
        case textColor = "text_color"
        case slug
//        case topicCount = "topic_count"
//        case postCount = "post_count"
//        case position
//        case description
//        case descriptionText = "description_text"
//        case topicUrl = "topic_url"
//        case readRestricted = "read_restricted"
//        case permission
//        case notificationLevel = "notification_level"
//        case topicTemplate = "topic_template"
//        case hasChildren = "has_children"
//        case sortOrder = "sort_order"
//        case sortAscending = "sort_ascending"
//        case showSubcategoryList = "show_subcategory_list"
//        case numFeaturedTopics = "num_featured_topics"
//        case defaultView = "default_view  "
//        case subcategoryListStyle = "subcategory_list_style"
//        case defaultTopPeriod = "default_top_period"
//        case minimumRequiredTags = "minimum_required_tags"
//        case navigateToFirstPostAfterRead = "navigate_to_first_post_after_read"
//        case topicsDay = "topics_day"
//        case topicsWeek = "topics_week"
//        case topicsMonth = "topics_month"
//        case topicsYear = "topics_year"
//        case topicsAllTime = "topics_all_time"
//        case descriptionExcerpt = "description_excerpt"
//        case isUncategorized = "is_uncategorized"
//        case uploadedLogo = "uploaded_logo"
//        case uploadedBackground = "uploaded_background"
    }
}
