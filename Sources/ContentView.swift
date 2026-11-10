import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        
        // Ищем файл index.html внутри нашего приложения
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            // Разрешаем доступ к папке, чтобы подгрузились картинки и видео из папки assets
            let directoryURL = url.deletingLastPathComponent()
            webView.loadFileURL(url, allowingReadAccessTo: directoryURL)
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
