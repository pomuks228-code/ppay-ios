import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        
        // Ищем файл index.html
        if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            // Разрешаем чтение из ВСЕЙ корневой папки приложения
            webView.loadFileURL(indexURL, allowingReadAccessTo: Bundle.main.bundleURL)
        }
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

@main
struct PPayApp: App {
    var body: some Scene {
        WindowGroup {
            WebView()
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
        }
    }
}
