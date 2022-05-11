import Foundation

public class Urls: NSObject {
    static let urlBase = "https://www.metaweather.com/api/"
    static let search = urlBase + "location/search/?query="
    static let detail = urlBase + "location/"
}
