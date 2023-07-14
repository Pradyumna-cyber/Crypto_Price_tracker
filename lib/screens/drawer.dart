// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyHeader extends StatefulWidget {
//   MyHeader({Key? key}) : super(key: key);
//
//   @override
//   State<MyHeader> createState() => _MyHeaderState();
// }
//
// class _MyHeaderState extends State<MyHeader> {
//   Color _color=Colors.blueGrey;
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//
//         backgroundColor: Colors.blue,
//         child: Column(
//           children:  [
//             const DrawerHeader(
//               child: UserAccountsDrawerHeader(
//                 margin: EdgeInsets.zero,
//                 accountName: Text("Pradyumna Aher"),
//                 accountEmail: Text("pradyumna@gmail.com"),
//                 currentAccountPicture: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         'https://e7.pngegg.com/pngimages/146/939/png-clipart-avatar-boy-male-avatar-child-face.png')),
//               ),
//             ),
//             ListTile(
//               leading: GestureDetector(
//                 onTap: (){
//                   setState(){
//
//                   }
//                 },
//                 child: Icon(
//                   CupertinoIcons.home,
//                   color: Colors.white,
//                 ),
//               ),
//               title: Text(
//                 "Home",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 CupertinoIcons.profile_circled,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "Profile",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 CupertinoIcons.settings,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "Settings",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//
//     );
//   }
// }
