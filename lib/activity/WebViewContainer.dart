import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.setNavigationDelegate(
        NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
      if (request.url.startsWith('https://payg.in/')) {
        print('blocking navigation to $request}');
        Navigator.of(context).pop();
        return NavigationDecision.prevent;
      }
      return NavigationDecision.navigate;
    }));
    _controller.loadRequest(Uri.parse(_url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebViewWidget(
              key: _key,
              controller: _controller,
              // javascriptMode: JavaScriptMode.unrestricted,
              // initialUrl: _url,
              // navigationDelegate: (NavigationRequest request) {
              //   if (request.url.startsWith('https://payg.in/')) {
              //     print('blocking navigation to $request}');
              //     Navigator.of(context).pop();
              //     return NavigationDecision.prevent;
              //   };
              //   return NavigationDecision.navigate;
              // },
            ))
          ],
        ));
  }
}
