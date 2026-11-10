import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        
        if let filepath = Bundle.main.path(forResource: "index", ofType: "html") {
            do {
                let html = try String(contentsOfFile: filepath)
                let baseUrl = URL(fileURLWithPath: filepath).deletingLastPathComponent()
                webView.loadHTMLString(html, baseURL: baseUrl)
            } catch {
                print("Ошибка загрузки HTML")
            }
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
