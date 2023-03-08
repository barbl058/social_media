// import 'package:flutter/material.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
//
// class HomePageWeb extends StatefulWidget {
//   const HomePageWeb({super.key});
//
//   @override
//   State<HomePageWeb> createState() => _HomePageWebState();
// }
//
// class _HomePageWebState extends State<HomePageWeb> {
//   final PageController _controller = PageController();
//   final Map<String, PlatformWebViewController?> _webViewControllers = {};
//
//   // /// Only can have previous, current and next
//   // final Map<String, WebViewWidget?> _webViewWidgets = {};
//
//   static const List<String> _urls = [
//     'https://storage.googleapis.com/lunts-dev.appspot.com/TIK%20TOK%20Video.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/IG%20Reel.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/IG%20Post.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/IG1.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/IG2.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/IG3.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/TT1.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/TT2.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/TT3.html',
//     'https://storage.googleapis.com/lunts-dev.appspot.com/TT4.html',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize controllers map in null
//     for (final url in _urls) {
//       _webViewControllers[url] = null;
//     }
//
//     _controller.addListener(() {
//       final isPageLoaded = _controller.page != null &&
//           _controller.page == _controller.page!.roundToDouble();
//       if (isPageLoaded) {
//         _takeMoreControllersAt(_controller.page!.toInt());
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     _controller.dispose();
//   }
//
//   void _takeMoreControllersAt(int index) {
//     int? previousIndex = index > 0 ? index - 1 : null;
//     int? nextIndex = _urls.length > index + 1 ? index + 1 : null;
//
//     if (previousIndex != null) {
//       final previousUrl = _urls[previousIndex];
//       if (_webViewControllers[previousUrl] == null) {
//         _webViewControllers[previousUrl] = _buildWebViewController(
//           previousUrl,
//         );
//       }
//     }
//
//     final url = _urls[index];
//     if (_webViewControllers[url] == null) {
//       _webViewControllers[url] = _buildWebViewController(url);
//     }
//
//     if (nextIndex != null) {
//       final nextUrl = _urls[nextIndex];
//       if (_webViewControllers[nextUrl] == null) {
//         _webViewControllers[nextUrl] = _buildWebViewController(
//           nextUrl,
//         );
//       }
//     }
//   }
//
//   PlatformWebViewController _buildWebViewController(String uri) =>
//       PlatformWebViewController(
//         const PlatformWebViewControllerCreationParams(),
//       )..loadRequest(
//           LoadRequestParams(uri: Uri.parse(uri)),
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Post PageView POC'),
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _controller.previousPage(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.linear,
//               );
//             },
//             child: const Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.white,
//               size: 32,
//             ),
//           ),
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: _urls.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var webViewController = _webViewControllers[_urls[index]];
//
//                 if (webViewController == null) {
//                   _takeMoreControllersAt(index);
//                   webViewController = _webViewControllers[_urls[index]];
//                 }
//
//                 return PlatformWebViewWidget(
//                   PlatformWebViewWidgetCreationParams(
//                     controller: webViewController!,
//                     key: ValueKey(index),
//                   ),
//                 ).build(context);
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _controller.nextPage(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.linear,
//               );
//             },
//             child: const Icon(
//               Icons.arrow_forward_ios_outlined,
//               color: Colors.white,
//               size: 32,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
