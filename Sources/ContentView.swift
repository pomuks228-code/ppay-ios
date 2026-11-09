import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

@main
struct PPayApp: App {
    var body: some Scene {
        WindowGroup {
            // Ссылка на твой сервер API
            WebView(url: URL(string: "https://rombank.pythonanywhere.com")!)
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
        }
    }
}
