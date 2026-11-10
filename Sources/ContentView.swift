import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        // СОЗДАЕМ КОНФИГУРАЦИЮ ДО СОЗДАНИЯ WEBVIEW
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        
        // Ищем файл index.html
        if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") {
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
