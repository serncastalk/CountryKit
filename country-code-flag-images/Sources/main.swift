import Foundation

// MARK: - Configuration

// IMPORTANT: Adjust these paths to your actual directories
let sourceDirectoryPath = "./standardized-rectangle-120px" // e.g., "/Users/youruser/Desktop/MyImages"
let outputParentDirectoryPath = "./output" // e.g., "/Users/youruser/MyXcodeProject"

let assetCatalogName = "Assets.xcassets"
let assetCatalogPath = URL(fileURLWithPath: outputParentDirectoryPath).appendingPathComponent(assetCatalogName)

let supportedExtensions: Set<String> = ["png", "jpg", "jpeg", "heic", "webp", "gif"] // Lowercased

// MARK: - Data Structures for Contents.json

struct ImageSetContent: Encodable {
    let images: [ImageInfo]
    let info: Info
}

struct ImageInfo: Encodable {
    let filename: String
    let idiom: String
    let scale: String // "1x", "2x", "3x"
}

struct Info: Encodable {
    let author: String
    let version: Int
}

open class Country: Codable {

  // MARK: - Properties

  /// **CountryKit**
  ///
  /// Country name.
  public let name: String

  /// **CountryKit**
  ///
  /// Country ISO code.
  public let iso: String

  /// **CountryKit**
  ///
  /// Country phone code.
  public let phoneCode: Int?

  /// **CountryKit**
  ///
  /// Country code.
  public let countryCode: Int?
  /// **CountryKit**
  ///
  /// Returns the country localized name in the user's region settings (or an empty string).
  public var localizedName: String {
    let locale = NSLocale.current as NSLocale
    let name = locale.displayName(forKey: .countryCode, value: iso)

    return name ?? ""
  }

  /// **CountryKit**
  ///
  /// Returns the country's flag emoji.
  public var emoji: String {
    let country = iso.uppercased()
    let emoji = country.unicodeScalars.compactMap { UnicodeScalar(127397 + $0.value) }.map { String($0) }.joined()

    //    for unicodeScalar in country.unicodeScalars {
    //      let scalar = UnicodeScalar(127397 + unicodeScalar.value)!
    //      emoji.append(String(scalar))
    //    }

    return emoji
  }

  // MARK: - Initializers

  public init(name: String, iso: String, phoneCode: Int?, countryCode: Int?) {
    self.name = name
    self.iso = iso
    self.phoneCode = phoneCode
    self.countryCode = countryCode
  }

  // MARK: - Private

  private enum CodingKeys: String, CodingKey {
    case name
    case iso
    case phoneCode
    case countryCode
  }

}

struct XCAssetsContent: Encodable {
    let info: Info
}

let _countries = [
  Country(name: "Afghanistan", iso: "AF", phoneCode: 93, countryCode: 4),
  Country(name: "Aland Islands", iso: "AX", phoneCode: nil, countryCode: 248),
  Country(name: "Albania", iso: "AL", phoneCode: 355, countryCode: 8),
  Country(name: "Algeria", iso: "DZ", phoneCode: 213, countryCode: 12),
  Country(name: "American Samoa", iso: "AS", phoneCode: 684, countryCode: 16),
  Country(name: "Andorra", iso: "AD", phoneCode: 376, countryCode: 20),
  Country(name: "Angola", iso: "AO", phoneCode: 244, countryCode: 24),
  Country(name: "Anguilla", iso: "AI", phoneCode: 1264, countryCode: 660),
  Country(name: "Antarctica", iso: "AQ", phoneCode: 672, countryCode: 10),
  Country(name: "Antigua and Barbuda", iso: "AG", phoneCode: 1268, countryCode: 28),
  Country(name: "Argentina", iso: "AR", phoneCode: 54, countryCode: 32),
  Country(name: "Armenia", iso: "AM", phoneCode: 374, countryCode: 51),
  Country(name: "Aruba", iso: "AW", phoneCode: 297, countryCode: 533),
  Country(name: "Ascension Island", iso: "AC", phoneCode: 247, countryCode: nil),
  Country(name: "Australia", iso: "AU", phoneCode: 61, countryCode: 36),
  Country(name: "Austria", iso: "AT", phoneCode: 43, countryCode: 40),
  Country(name: "Azerbaijan", iso: "AZ", phoneCode: 994, countryCode: 31),
  Country(name: "Bahamas", iso: "BS", phoneCode: 1242, countryCode: 44),
  Country(name: "Bahrain", iso: "BH", phoneCode: 973, countryCode: 48),
  Country(name: "Bangladesh", iso: "BD", phoneCode: 880, countryCode: 50),
  Country(name: "Barbados", iso: "BB", phoneCode: 1246, countryCode: 52),
  Country(name: "Belarus", iso: "BY", phoneCode: 375, countryCode: 112),
  Country(name: "Belgium", iso: "BE", phoneCode: 32, countryCode: 56),
  Country(name: "Belize", iso: "BZ", phoneCode: 501, countryCode: 84),
  Country(name: "Benin", iso: "BJ", phoneCode: 229, countryCode: 204),
  Country(name: "Bermuda", iso: "BM", phoneCode: 1441, countryCode: 60),
  Country(name: "Bhutan", iso: "BT", phoneCode: 975, countryCode: 64),
  Country(name: "Bolivia", iso: "BO", phoneCode: 591, countryCode: 68),
  Country(name: "Bonaire, Sint Eustatius and Saba", iso: "BQ", phoneCode: 599, countryCode: nil),
  Country(name: "Bosnia and Herzegovina", iso: "BA", phoneCode: 387, countryCode: 70),
  Country(name: "Botswana", iso: "BW", phoneCode: 267, countryCode: 72),
  Country(name: "Bouvet Island", iso: "BV", phoneCode: nil, countryCode: 74),
  Country(name: "Brazil", iso: "BR", phoneCode: 55, countryCode: 76),
  Country(name: "British Indian Ocean Territory", iso: "IO", phoneCode: nil, countryCode: 86),
  Country(name: "British Virgin Islands", iso: "VG", phoneCode: 1284, countryCode: 92),
  Country(name: "Brunei Darussalam", iso: "BN", phoneCode: 673, countryCode: 96),
  Country(name: "Bulgaria", iso: "BG", phoneCode: 359, countryCode: 100),
  Country(name: "Burkina Faso", iso: "BF", phoneCode: 226, countryCode: 854),
  Country(name: "Burundi", iso: "BI", phoneCode: 257, countryCode: 108),
  Country(name: "Cambodia", iso: "KH", phoneCode: 855, countryCode: 116),
  Country(name: "Cameroon", iso: "CM", phoneCode: 237, countryCode: 120),
  Country(name: "Canada", iso: "CA", phoneCode: 1, countryCode: 124),
  Country(name: "Canary Islands", iso: "IC", phoneCode: 34, countryCode: nil),
  Country(name: "Cape Verde", iso: "CV", phoneCode: 238, countryCode: 132),
  Country(name: "Cayman Islands", iso: "KY", phoneCode: 1345, countryCode: 136),
  Country(name: "Central African Republic", iso: "CF", phoneCode: 236, countryCode: 140),
  Country(name: "Ceuta & Melilla", iso: "EA", phoneCode: 34, countryCode: nil),
  Country(name: "Chad", iso: "TD", phoneCode: 235, countryCode: 148),
  Country(name: "Chile", iso: "CL", phoneCode: 56, countryCode: 152),
  Country(name: "China", iso: "CN", phoneCode: 86, countryCode: 156),
  Country(name: "Christmas Island", iso: "CX", phoneCode: 61, countryCode: 162),
  Country(name: "Clipperton Island", iso: "CP", phoneCode: nil, countryCode: nil),
  Country(name: "Cocos (Keeling) Islands", iso: "CC", phoneCode: 61, countryCode: 166),
  Country(name: "Colombia", iso: "CO", phoneCode: 57, countryCode: 170),
  Country(name: "Comoros", iso: "KM", phoneCode: 269, countryCode: 174),
  Country(name: "Congo", iso: "CD", phoneCode: 243, countryCode: 180),
  Country(name: "Congo", iso: "CG", phoneCode: 242, countryCode: 178),
  Country(name: "Cook Islands", iso: "CK", phoneCode: 682, countryCode: 184),
  Country(name: "Costa Rica", iso: "CR", phoneCode: 506, countryCode: 188),
  Country(name: "Cote d'Ivoire", iso: "CI", phoneCode: 225, countryCode: 384),
  Country(name: "Croatia", iso: "HR", phoneCode: 385, countryCode: 191),
  Country(name: "Cuba", iso: "CU", phoneCode: 53, countryCode: 192),
  Country(name: "Curaçao", iso: "CW", phoneCode: 599, countryCode: nil),
  Country(name: "Cyprus", iso: "CY", phoneCode: 357, countryCode: 196),
  Country(name: "Czech Republic", iso: "CZ", phoneCode: 420, countryCode: 203),
  Country(name: "Denmark", iso: "DK", phoneCode: 45, countryCode: 208),
  Country(name: "Diego Garcia", iso: "DG", phoneCode: 246, countryCode: nil),
  Country(name: "Djibouti", iso: "DJ", phoneCode: 253, countryCode: 262),
  Country(name: "Dominica", iso: "DM", phoneCode: 1767, countryCode: 212),
  Country(name: "Dominican Republic", iso: "DO", phoneCode: 809, countryCode: 214),
  Country(name: "Ecuador", iso: "EC", phoneCode: 593, countryCode: 218),
  Country(name: "Egypt", iso: "EG", phoneCode: 20, countryCode: 818),
  Country(name: "El Salvador", iso: "SV", phoneCode: 503, countryCode: 222),
  Country(name: "Equatorial Guinea", iso: "GQ", phoneCode: 240, countryCode: 226),
  Country(name: "Eritrea", iso: "ER", phoneCode: 291, countryCode: 232),
  Country(name: "Estonia", iso: "EE", phoneCode: 372, countryCode: 233),
  Country(name: "Ethiopia", iso: "ET", phoneCode: 251, countryCode: 231),
  Country(name: "Falkland Islands", iso: "FK", phoneCode: 500, countryCode: 238),
  Country(name: "Faroe Islands", iso: "FO", phoneCode: 298, countryCode: 234),
  Country(name: "Fiji", iso: "FJ", phoneCode: 679, countryCode: 242),
  Country(name: "Finland", iso: "FI", phoneCode: 358, countryCode: 246),
  Country(name: "France", iso: "FR", phoneCode: 33, countryCode: 250),
  Country(name: "French Guiana", iso: "GF", phoneCode: 594, countryCode: 254),
  Country(name: "French Polynesia", iso: "PF", phoneCode: 689, countryCode: 258),
  Country(name: "French Southern Territories", iso: "TF", phoneCode: nil, countryCode: 260),
  Country(name: "Gabon", iso: "GA", phoneCode: 241, countryCode: 266),
  Country(name: "Gambia", iso: "GM", phoneCode: 220, countryCode: 270),
  Country(name: "Georgia", iso: "GE", phoneCode: 995, countryCode: 268),
  Country(name: "Germany", iso: "DE", phoneCode: 49, countryCode: 276),
  Country(name: "Ghana", iso: "GH", phoneCode: 233, countryCode: 288),
  Country(name: "Gibraltar", iso: "GI", phoneCode: 350, countryCode: 292),
  Country(name: "Greece", iso: "GR", phoneCode: 30, countryCode: 300),
  Country(name: "Greenland", iso: "GL", phoneCode: 299, countryCode: 304),
  Country(name: "Grenada", iso: "GD", phoneCode: 1473, countryCode: 308),
  Country(name: "Guadeloupe", iso: "GP", phoneCode: 590, countryCode: 312),
  Country(name: "Guam", iso: "GU", phoneCode: 1671, countryCode: 316),
  Country(name: "Guatemala", iso: "GT", phoneCode: 502, countryCode: 320),
  Country(name: "Guernsey", iso: "GG", phoneCode: nil, countryCode: 831),
  Country(name: "Guinea", iso: "GN", phoneCode: 224, countryCode: 324),
  Country(name: "Guinea-Bissau", iso: "GW", phoneCode: 245, countryCode: 624),
  Country(name: "Guyana", iso: "GY", phoneCode: 592, countryCode: 328),
  Country(name: "Haiti", iso: "HT", phoneCode: 509, countryCode: 332),
  Country(name: "Heard Island and McDonald Islands", iso: "HM", phoneCode: nil, countryCode: 334),
  Country(name: "Holy See", iso: "VA", phoneCode: 39, countryCode: 336),
  Country(name: "Honduras", iso: "HN", phoneCode: 504, countryCode: 340),
  Country(name: "Hong Kong", iso: "HK", phoneCode: 852, countryCode: 344),
  Country(name: "Hungary", iso: "HU", phoneCode: 36, countryCode: 348),
  Country(name: "Iceland", iso: "IS", phoneCode: 354, countryCode: 352),
  Country(name: "India", iso: "IN", phoneCode: 91, countryCode: 356),
  Country(name: "Indonesia", iso: "ID", phoneCode: 62, countryCode: 360),
  Country(name: "Iran", iso: "IR", phoneCode: 98, countryCode: 364),
  Country(name: "Iraq", iso: "IQ", phoneCode: 964, countryCode: 368),
  Country(name: "Ireland", iso: "IE", phoneCode: 353, countryCode: 372),
  Country(name: "Isle of Man", iso: "IM", phoneCode: nil, countryCode: 833),
  Country(name: "Israel", iso: "IL", phoneCode: 972, countryCode: 376),
  Country(name: "Italy", iso: "IT", phoneCode: 39, countryCode: 380),
  Country(name: "Jamaica", iso: "JM", phoneCode: 1876, countryCode: 388),
  Country(name: "Japan", iso: "JP", phoneCode: 81, countryCode: 392),
  Country(name: "Jersey", iso: "JE", phoneCode: nil, countryCode: 832),
  Country(name: "Jordan", iso: "JO", phoneCode: 962, countryCode: 400),
  Country(name: "Kazakhstan", iso: "KZ", phoneCode: 7, countryCode: 398),
  Country(name: "Kenya", iso: "KE", phoneCode: 254, countryCode: 404),
  Country(name: "Kiribati", iso: "KI", phoneCode: 686, countryCode: 296),
  Country(name: "Korea", iso: "KR", phoneCode: 82, countryCode: 410),
  Country(name: "Korea", iso: "KP", phoneCode: 850, countryCode: 408),
  Country(name: "Kosovo", iso: "XK", phoneCode: 383, countryCode: nil),
  Country(name: "Kuwait", iso: "KW", phoneCode: 965, countryCode: 414),
  Country(name: "Kyrgyz Republic", iso: "KG", phoneCode: 996, countryCode: 417),
  Country(name: "Lao People's Democratic Republic", iso: "LA", phoneCode: 856, countryCode: 418),
  Country(name: "Latvia", iso: "LV", phoneCode: 371, countryCode: 428),
  Country(name: "Lebanon", iso: "LB", phoneCode: 961, countryCode: 422),
  Country(name: "Lesotho", iso: "LS", phoneCode: 266, countryCode: 426),
  Country(name: "Liberia", iso: "LR", phoneCode: 231, countryCode: 430),
  Country(name: "Libyan Arab Jamahiriya", iso: "LY", phoneCode: 218, countryCode: 434),
  Country(name: "Liechtenstein", iso: "LI", phoneCode: 423, countryCode: 438),
  Country(name: "Lithuania", iso: "LT", phoneCode: 370, countryCode: 440),
  Country(name: "Luxembourg", iso: "LU", phoneCode: 352, countryCode: 442),
  Country(name: "Macao", iso: "MO", phoneCode: 853, countryCode: 446),
  Country(name: "Macedonia", iso: "MK", phoneCode: 389, countryCode: 807),
  Country(name: "Madagascar", iso: "MG", phoneCode: 261, countryCode: 450),
  Country(name: "Malawi", iso: "MW", phoneCode: 265, countryCode: 454),
  Country(name: "Malaysia", iso: "MY", phoneCode: 60, countryCode: 458),
  Country(name: "Maldives", iso: "MV", phoneCode: 960, countryCode: 462),
  Country(name: "Mali", iso: "ML", phoneCode: 223, countryCode: 466),
  Country(name: "Malta", iso: "MT", phoneCode: 356, countryCode: 470),
  Country(name: "Marshall Islands", iso: "MH", phoneCode: 692, countryCode: 584),
  Country(name: "Martinique", iso: "MQ", phoneCode: 596, countryCode: 474),
  Country(name: "Mauritania", iso: "MR", phoneCode: 222, countryCode: 478),
  Country(name: "Mauritius", iso: "MU", phoneCode: 230, countryCode: 480),
  Country(name: "Mayotte", iso: "YT", phoneCode: 269, countryCode: 175),
  Country(name: "Mexico", iso: "MX", phoneCode: 52, countryCode: 484),
  Country(name: "Micronesia", iso: "FM", phoneCode: 691, countryCode: 583),
  Country(name: "Moldova", iso: "MD", phoneCode: 373, countryCode: 498),
  Country(name: "Monaco", iso: "MC", phoneCode: 377, countryCode: 492),
  Country(name: "Mongolia", iso: "MN", phoneCode: 976, countryCode: 496),
  Country(name: "Montenegro", iso: "ME", phoneCode: 382, countryCode: 499),
  Country(name: "Montserrat", iso: "MS", phoneCode: 1664, countryCode: 500),
  Country(name: "Morocco", iso: "MA", phoneCode: 212, countryCode: 504),
  Country(name: "Mozambique", iso: "MZ", phoneCode: 258, countryCode: 508),
  Country(name: "Myanmar", iso: "MM", phoneCode: 95, countryCode: 104),
  Country(name: "Namibia", iso: "NA", phoneCode: 264, countryCode: 516),
  Country(name: "Nauru", iso: "NR", phoneCode: 674, countryCode: 520),
  Country(name: "Nepal", iso: "NP", phoneCode: 977, countryCode: 524),
  Country(name: "Netherlands", iso: "NL", phoneCode: 31, countryCode: 528),
  Country(name: "New Caledonia", iso: "NC", phoneCode: 687, countryCode: 540),
  Country(name: "New Zealand", iso: "NZ", phoneCode: 64, countryCode: 554),
  Country(name: "Nicaragua", iso: "NI", phoneCode: 505, countryCode: 558),
  Country(name: "Niger", iso: "NE", phoneCode: 227, countryCode: 562),
  Country(name: "Nigeria", iso: "NG", phoneCode: 234, countryCode: 566),
  Country(name: "Niue", iso: "NU", phoneCode: 683, countryCode: 570),
  Country(name: "Norfolk Island", iso: "NF", phoneCode: 672, countryCode: 574),
  Country(name: "Northern Mariana Islands", iso: "MP", phoneCode: 670, countryCode: 580),
  Country(name: "Norway", iso: "NO", phoneCode: 47, countryCode: 578),
  Country(name: "Oman", iso: "OM", phoneCode: 968, countryCode: 512),
  Country(name: "Pakistan", iso: "PK", phoneCode: 92, countryCode: 586),
  Country(name: "Palau", iso: "PW", phoneCode: 680, countryCode: 585),
  Country(name: "Palestinian Territory", iso: "PS", phoneCode: nil, countryCode: 275),
  Country(name: "Panama", iso: "PA", phoneCode: 507, countryCode: 591),
  Country(name: "Papua New Guinea", iso: "PG", phoneCode: 675, countryCode: 598),
  Country(name: "Paraguay", iso: "PY", phoneCode: 595, countryCode: 600),
  Country(name: "Peru", iso: "PE", phoneCode: 51, countryCode: 604),
  Country(name: "Philippines", iso: "PH", phoneCode: 63, countryCode: 608),
  Country(name: "Pitcairn Islands", iso: "PN", phoneCode: nil, countryCode: 612),
  Country(name: "Poland", iso: "PL", phoneCode: 48, countryCode: 616),
  Country(name: "Portugal", iso: "PT", phoneCode: 351, countryCode: 620),
  Country(name: "Puerto Rico", iso: "PR", phoneCode: 1787, countryCode: 630),
  Country(name: "Qatar", iso: "QA", phoneCode: 974, countryCode: 634),
  Country(name: "Reunion", iso: "RE", phoneCode: 262, countryCode: 638),
  Country(name: "Romania", iso: "RO", phoneCode: 40, countryCode: 642),
  Country(name: "Russian Federation", iso: "RU", phoneCode: 7, countryCode: 643),
  Country(name: "Rwanda", iso: "RW", phoneCode: 250, countryCode: 646),
  Country(name: "Saint Barthelemy", iso: "BL", phoneCode: nil, countryCode: 652),
  Country(name: "Saint Helena", iso: "SH", phoneCode: 290, countryCode: 654),
  Country(name: "Saint Kitts and Nevis", iso: "KN", phoneCode: 1869, countryCode: 659),
  Country(name: "Saint Lucia", iso: "LC", phoneCode: 1758, countryCode: 662),
  Country(name: "Saint Martin", iso: "MF", phoneCode: nil, countryCode: 663),
  Country(name: "Saint Pierre and Miquelon", iso: "PM", phoneCode: 508, countryCode: 666),
  Country(name: "Saint Vincent and the Grenadines", iso: "VC", phoneCode: 1784, countryCode: 670),
  Country(name: "Samoa", iso: "WS", phoneCode: 684, countryCode: 882),
  Country(name: "San Marino", iso: "SM", phoneCode: 378, countryCode: 674),
  Country(name: "Sao Tome and Principe", iso: "ST", phoneCode: 239, countryCode: 678),
  Country(name: "Saudi Arabia", iso: "SA", phoneCode: 966, countryCode: 682),
  Country(name: "Senegal", iso: "SN", phoneCode: 221, countryCode: 686),
  Country(name: "Serbia", iso: "RS", phoneCode: 381, countryCode: 688),
  Country(name: "Seychelles", iso: "SC", phoneCode: 248, countryCode: 690),
  Country(name: "Sierra Leone", iso: "SL", phoneCode: 232, countryCode: 694),
  Country(name: "Singapore", iso: "SG", phoneCode: 65, countryCode: 702),
  Country(name: "Sint Maarten (Dutch part)", iso: "SX", phoneCode: 1721, countryCode: nil),
  Country(name: "Slovakia", iso: "SK", phoneCode: 421, countryCode: 703),
  Country(name: "Slovenia", iso: "SI", phoneCode: 386, countryCode: 705),
  Country(name: "Solomon Islands", iso: "SB", phoneCode: 677, countryCode: 90),
  Country(name: "Somalia", iso: "SO", phoneCode: 252, countryCode: 706),
  Country(name: "South Africa", iso: "ZA", phoneCode: 27, countryCode: 710),
  Country(name: "South Georgia and the South Sandwich Islands", iso: "GS", phoneCode: nil, countryCode: 239),
  Country(name: "South Sudan", iso: "SS", phoneCode: 211, countryCode: nil),
  Country(name: "Spain", iso: "ES", phoneCode: 34, countryCode: 724),
  Country(name: "Sri Lanka", iso: "LK", phoneCode: 94, countryCode: 144),
  Country(name: "Sudan", iso: "SD", phoneCode: 249, countryCode: 736),
  Country(name: "Suriname", iso: "SR", phoneCode: 597, countryCode: 740),
  Country(name: "Svalbard & Jan Mayen Islands", iso: "SJ", phoneCode: nil, countryCode: 744),
  Country(name: "Swaziland", iso: "SZ", phoneCode: 268, countryCode: 748),
  Country(name: "Sweden", iso: "SE", phoneCode: 46, countryCode: 752),
  Country(name: "Switzerland", iso: "CH", phoneCode: 41, countryCode: 756),
  Country(name: "Syrian Arab Republic", iso: "SY", phoneCode: 963, countryCode: 760),
  Country(name: "Taiwan", iso: "TW", phoneCode: 886, countryCode: 158),
  Country(name: "Tajikistan", iso: "TJ", phoneCode: 992, countryCode: 762),
  Country(name: "Tanzania", iso: "TZ", phoneCode: 255, countryCode: 834),
  Country(name: "Thailand", iso: "TH", phoneCode: 66, countryCode: 764),
  Country(name: "Timor-Leste", iso: "TL", phoneCode: nil, countryCode: 626),
  Country(name: "Togo", iso: "TG", phoneCode: 228, countryCode: 768),
  Country(name: "Tokelau", iso: "TK", phoneCode: 690, countryCode: 772),
  Country(name: "Tonga", iso: "TO", phoneCode: 676, countryCode: 776),
  Country(name: "Trinidad and Tobago", iso: "TT", phoneCode: 1868, countryCode: 780),
  Country(name: "Tristan da Cunha", iso: "TA", phoneCode: 290, countryCode: nil),
  Country(name: "Tunisia", iso: "TN", phoneCode: 216, countryCode: 788),
  Country(name: "Turkey", iso: "TR", phoneCode: 90, countryCode: 792),
  Country(name: "Turkmenistan", iso: "TM", phoneCode: 993, countryCode: 795),
  Country(name: "Turks and Caicos Islands", iso: "TC", phoneCode: 1649, countryCode: 796),
  Country(name: "Tuvalu", iso: "TV", phoneCode: 688, countryCode: 798),
  Country(name: "Uganda", iso: "UG", phoneCode: 256, countryCode: 800),
  Country(name: "Ukraine", iso: "UA", phoneCode: 380, countryCode: 804),
  Country(name: "United Arab Emirates", iso: "AE", phoneCode: 971, countryCode: 784),
  Country(name: "United Kingdom of Great Britain & Northern Ireland", iso: "GB", phoneCode: 44, countryCode: 826),
  Country(name: "United States Minor Outlying Islands", iso: "UM", phoneCode: 1, countryCode: nil),
  Country(name: "United States of America", iso: "US", phoneCode: 1, countryCode: 840),
  Country(name: "United States Virgin Islands", iso: "VI", phoneCode: 1340, countryCode: 850),
  Country(name: "Uruguay", iso: "UY", phoneCode: 598, countryCode: 858),
  Country(name: "Uzbekistan", iso: "UZ", phoneCode: 998, countryCode: 860),
  Country(name: "Vanuatu", iso: "VU", phoneCode: 678, countryCode: 548),
  Country(name: "Venezuela", iso: "VE", phoneCode: 58, countryCode: 862),
  Country(name: "Vietnam", iso: "VN", phoneCode: 84, countryCode: 704),
  Country(name: "Wallis and Futuna", iso: "WF", phoneCode: 681, countryCode: 876),
  Country(name: "Western Sahara", iso: "EH", phoneCode: nil, countryCode: 732),
  Country(name: "Yemen", iso: "YE", phoneCode: 967, countryCode: 887),
  Country(name: "Zambia", iso: "ZM", phoneCode: 260, countryCode: 894),
  Country(name: "Zimbabwe", iso: "ZW", phoneCode: 263, countryCode: 716),
]


// MARK: - Main Logic
@MainActor
func createXcodeImageAssets() {
    let fileManager = FileManager.default

    // 1. Validate Source Directory
    let sourceURL = URL(fileURLWithPath: sourceDirectoryPath)
    guard fileManager.fileExists(atPath: sourceURL.path) else {
        print("Error: Source directory '\(sourceURL.path)' does not exist.")
        exit(1)
    }

    // 2. Create Output Parent Directory if it doesn't exist
    do {
        if !fileManager.fileExists(atPath: outputParentDirectoryPath) {
            try fileManager.createDirectory(atPath: outputParentDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            print("Created output parent directory: '\(outputParentDirectoryPath)'")
        }
    } catch {
        print("Error creating output parent directory: \(error.localizedDescription)")
        exit(1)
    }

    // 3. Create the .xcassets directory and its top-level Contents.json
    do {
        if !fileManager.fileExists(atPath: assetCatalogPath.path) {
            try fileManager.createDirectory(atPath: assetCatalogPath.path, withIntermediateDirectories: true, attributes: nil)
            print("Created .xcassets directory: '\(assetCatalogPath.path)'")

            let xcassetsInfo = XCAssetsContent(info: Info(author: "xcode", version: 1))
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted // For human-readable JSON

            let jsonData = try encoder.encode(xcassetsInfo)
            let jsonPath = assetCatalogPath.appendingPathComponent("Contents.json")
            try jsonData.write(to: jsonPath, options: .atomicWrite)
            print("Created Contents.json for '\(assetCatalogName)'")
        } else {
            print("'\(assetCatalogName)' already exists in '\(outputParentDirectoryPath)'.")
        }
    } catch {
        print("Error creating .xcassets or its Contents.json: \(error.localizedDescription)")
        exit(1)
    }
    
    var countryKitSet: Set<String> = .init()
    _countries.forEach {
        countryKitSet.insert($0.iso.lowercased())
    }

    // 4. Process each image file
    do {
        let imageFiles = try fileManager.contentsOfDirectory(at: sourceURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

        for imageURL in imageFiles {
            let fileExtension = imageURL.pathExtension.lowercased()
            guard supportedExtensions.contains(fileExtension) else {
                print("Skipping '\(imageURL.lastPathComponent)': Not a supported image file.")
                continue
            }

            let filename = imageURL.lastPathComponent
            let baseName = imageURL.deletingPathExtension().lastPathComponent.lowercased()
            guard countryKitSet.contains(baseName) else {
                print("\n CountryKit Not contain \(baseName)")
                continue
            }
            let imageSetName = "\(baseName).imageset"
            let imageSetPath = assetCatalogPath.appendingPathComponent(imageSetName)

            print("Processing '\(filename)'...")

            // Create the .imageset directory
            if !fileManager.fileExists(atPath: imageSetPath.path) {
                try fileManager.createDirectory(atPath: imageSetPath.path, withIntermediateDirectories: true, attributes: nil)
                print("  Created image set directory: '\(imageSetName)' inside '\(assetCatalogName)'")
            }

            // Copy the image into the .imageset directory
            let destinationImagePath = imageSetPath.appendingPathComponent(filename)
            try fileManager.copyItem(at: imageURL, to: destinationImagePath)
            print("  Copied '\(filename)' to '\(imageSetName)'")

            // Create the Contents.json file for the image set
            let imageInfo = ImageInfo(filename: filename, idiom: "universal", scale: "1x") // Default to 1x
            let imageSetContent = ImageSetContent(images: [imageInfo], info: Info(author: "xcode", version: 1))

            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted

            let jsonData = try encoder.encode(imageSetContent)
            let jsonPath = imageSetPath.appendingPathComponent("Contents.json")
            try jsonData.write(to: jsonPath, options: .atomicWrite)
            print("  Created Contents.json for '\(imageSetName)'")
        }
    } catch {
        print("Error processing image files: \(error.localizedDescription)")
        exit(1)
    }

    print("\nScript finished. An '\(assetCatalogName)' folder has been created in your output directory.")
    print("You can now drag this '\(assetCatalogName)' folder into your Xcode Project Navigator.")
}

// Execute the main function
createXcodeImageAssets()
