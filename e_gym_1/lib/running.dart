import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(RunningPage());
}

class RunningPage extends StatelessWidget {
  const RunningPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image(
                image: AssetImage('assets/running.png'),
                width: 400,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "러닝머신",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyWebView(),
                      ),
                    );
                  },
                  child: Text('사용법 영상 보기 !'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1E1651),
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color(0xff1E1651),
            child: SizedBox(
              height: 80.0,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/d');
                },
                child: Text(
                  "다시촬영하기",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  WebViewController? _webViewController;

  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://www.youtube.com/watch?v=lQX9SciOvBY'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: Color(0xff1E1651),

        title: Text('러닝머신'),
      ),
      body: WebViewWidget(controller: _webViewController!),
    );
  }
}
