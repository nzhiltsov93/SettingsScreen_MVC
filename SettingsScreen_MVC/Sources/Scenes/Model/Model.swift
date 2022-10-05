import Foundation

enum SettingsType {
    case title
    case notification
    case standard
    case switcher
    case detail
}

struct Settings {
    var title: String
    var icon: String
    var detail: String?
    var type: SettingsType
}

extension Settings {
    static var settings: [[Settings]] = [
    // Section 1
        [Settings(title: "Nikita Zhiltsov", icon: "1", detail: "Apple ID, iCloud, контент и покупки", type: .title)],
    // Section 2
        [Settings(title: "Авиарежим", icon: "flightmode", detail: nil, type: .switcher),
         Settings(title: "Wi-Fi", icon: "wifi", detail: "Выкл.", type: .detail),
         Settings(title: "Bluetooth", icon: "bluetooth", detail: "Выкл.", type: .detail),
         Settings(title: "Сотовая связь", icon: "cellular", detail: nil, type: .standard),
         Settings(title: "Режим модема", icon: "hotspot", detail: "Выкл.", type: .detail),
         Settings(title: "VPN", icon: "vpn", detail: nil, type: .switcher)],
    // Section 3
        [Settings(title: "Уведомления", icon: "notification", detail: nil, type: .standard),
         Settings(title: "Звуки, тактильные сигналы", icon: "sound", detail: nil, type: .standard),
         Settings(title: "Фокусирование", icon: "moon", detail: nil, type: .standard),
         Settings(title: "Экранное время", icon: "sandclock", detail: nil, type: .standard)],
    // Section 4
        [Settings(title: "Основные", icon: "settings", detail: nil, type: .notification),
         Settings(title: "Пункт управления", icon: "switch", detail: nil, type: .standard),
         Settings(title: "Экран и яркость", icon: "aA", detail: nil, type: .standard),
         Settings(title: "Экран домой", icon: "home", detail: nil, type: .standard),
         Settings(title: "Универсальный доступ", icon: "access", detail: nil, type: .standard),
         Settings(title: "Обои", icon: "page", detail: nil, type: .standard),
         Settings(title: "Siri и Поиск", icon: "siri", detail: nil, type: .standard),
         Settings(title: "Face ID и код-пароль", icon: "face", detail: nil, type: .standard),
         Settings(title: "Экстренный вызов - SOS", icon: "sos", detail: nil, type: .standard),
         Settings(title: "Уведомления о контакте", icon: "covid", detail: nil, type: .standard),
         Settings(title: "Аккумулятор", icon: "battery", detail: nil, type: .standard),
         Settings(title: "Конфиденциальность", icon: "private", detail: nil, type: .standard)]
    ]
}
