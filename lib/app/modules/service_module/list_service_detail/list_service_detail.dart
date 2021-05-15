// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:monitorflutter/app/routes/app_pages.dart';
// import 'package:monitorflutter/app/theme/my_scaffold.dart';
// import 'package:monitorflutter/app/utils/global_variables.dart';
//
// class ListServiceDetailStateScreen extends StatefulWidget {
//   @override
//   _ListServiceDetailStateScreenState createState() =>
//       _ListServiceDetailStateScreenState();
// }
//
// class _ListServiceDetailStateScreenState
//     extends State<ListServiceDetailStateScreen> {
//   final title = GlobalVariables.LIST_SERVICE_DETAIL_TITLE;
//   int selectedFilter = 0;
//   bool checkSelectedDeleteService = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MyScaffold(
//       bodyFunction: bodyFunction,
//       title: title,
//     );
//   }
//
//   bodyFunction() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           childFunction(),
//           SizedBox(
//             height: 11,
//           ),
//           listView()
//         ],
//       ),
//     );
//   }
//
//   Widget childFunction() {
//     return Row(
//       children: [
//         Expanded(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(6.0),
//             child: Container(
//               color: Colors.transparent,
//               height: 32,
//               child: TextFormField(
//                 autocorrect: true,
//                 textAlignVertical: TextAlignVertical.bottom,
//                 decoration: InputDecoration(
//                   fillColor: HexColor('#658998').withOpacity(0.25),
//                   filled: true,
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6.0),
//                     borderSide: BorderSide(color: HexColor('#406775')),
//                   ),
//                   suffixIcon: Icon(
//                     FontAwesome.search,
//                     color: HexColor('#658998').withOpacity(0.55),
//                     size: 18,
//                   ),
//                   hintText: GlobalVariables.LIST_SERVICE_FIND_NAME,
//                   hintStyle:
//                       TextStyle(fontSize: 13, color: HexColor('#658998')),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         PopupMenuButton(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(6.0))),
//           onSelected: (result) => _selectFilter(result),
//           color: HexColor('#25404B'),
//           icon: Icon(
//             FontAwesome.filter,
//             color: HexColor('#A2BAC4').withOpacity(0.55),
//             size: 16,
//           ),
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem(
//               value: 1,
//               child: ListTile(
//                 leading: Icon(
//                   Icons.cancel_outlined,
//                   color: HexColor('#FF7D7D'),
//                 ),
//                 title: Text(
//                   GlobalVariables.LIST_SERVICE_ERROR_STATUS,
//                   style: TextStyle(color: HexColor('#A2BAC4')),
//                 ),
//               ),
//             ),
//             PopupMenuItem(
//               value: 2,
//               child: ListTile(
//                 leading: Icon(
//                   Icons.warning_amber_outlined,
//                   color: HexColor('#F3C968'),
//                 ),
//                 title: Text(
//                   GlobalVariables.LIST_SERVICE_TROUBLE_STATUS,
//                   style: TextStyle(color: HexColor('#A2BAC4')),
//                 ),
//               ),
//             ),
//             PopupMenuItem(
//               value: 3,
//               child: ListTile(
//                 leading: Icon(
//                   FontAwesome.line_chart,
//                   color: HexColor('#1FCCB7'),
//                 ),
//                 title: Text(
//                   GlobalVariables.LIST_SERVICE_ACTIVE_STATUS,
//                   style: TextStyle(color: HexColor('#A2BAC4')),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget listView() {
//     return Expanded(
//       child: ListView.separated(
//         itemCount: 10,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             decoration: BoxDecoration(
//                 color: HexColor('#406775'),
//                 borderRadius: BorderRadius.circular(5.0)),
//             child: Column(
//               children: [
//                 ListTile(
//                   onTap: () {
//                     Get.toNamed(Routes.SERVICE_DETAIL, arguments: [
//                       1,
//                       "Tên service lấy trong dataaa aassssss ssssaaaaaa"
//                     ]);
//                   },
//                   contentPadding: EdgeInsets.all(0),
//                   leading: Padding(
//                     padding: const EdgeInsets.only(left: 15.0),
//                     child: Icon(
//                       FontAwesome.line_chart,
//                       color: HexColor('#1FCCB7'),
//                     ),
//                   ),
//                   title: Text(
//                     "Tên service lấy trong dataaa aassssss ssssaaaaaa",
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 18),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Text(
//                         "Last updated on - Apr 7, 2021 4:12:30 PM",
//                         style: TextStyle(
//                             color: HexColor('#A2BAC4').withOpacity(0.65),
//                             fontSize: 12),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(
//                                 left: 10.0, right: 10.0, top: 2.0, bottom: 3.0),
//                             decoration: BoxDecoration(
//                                 color: HexColor('#658998'),
//                                 borderRadius: BorderRadius.circular(2.0)),
//                             child: Center(
//                               child: Text(
//                                 "Tên miền",
//                                 softWrap: false,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 12),
//                               ),
//                             ),
//                             width: 70,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.insert_chart_outlined,
//                             color: HexColor('#A2BAC4'),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 140,
//                             child: Text(
//                               'Poll Frequency - 5 Mins',
//                               softWrap: false,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: HexColor('#A2BAC4').withOpacity(0.65)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   trailing: InkWell(
//                     child: Icon(
//                       Icons.more_vert,
//                       color: HexColor('#A2BAC4'),
//                       size: 30,
//                     ),
//                     onTap: () => showMaterialModalBottomSheet(
//                       expand: false,
//                       context: context,
//                       backgroundColor: Colors.transparent,
//                       builder: (context) => modalDetail(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return Divider();
//         },
//       ),
//     );
//   }
//
//   _selectFilter(result) {
//     setState(() {
//       print(result);
//     });
//   }
//
//   Widget modalDetail() {
//     return Container(
//       decoration: BoxDecoration(
//         color: HexColor('#325360'),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               'ayodvtfn.nethost-1511.000nethost.com',
//               style: TextStyle(
//                   fontSize: 15,
//                   color: HexColor('#A2BAC4'),
//                   fontWeight: FontWeight.bold),
//             ),
//             onTap: () => Navigator.of(context).maybePop(),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15.0),
//             child: Divider(
//               color: HexColor('#658998'),
//               height: 1,
//             ),
//           ),
//           ListTile(
//             title: Text(
//               GlobalVariables.LIST_SERVICE_DETAIL_EDIT_NAME,
//               style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//             ),
//             leading: Icon(
//               Icons.edit,
//               color: HexColor('#A2BAC4'),
//             ),
//             onTap: () => Navigator.of(context).maybePop(),
//           ),
//           ListTile(
//               title: Text(
//                 GlobalVariables.LIST_SERVICE_POLL_NAME,
//                 style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//               ),
//               leading: Icon(
//                 Icons.insert_chart_outlined,
//                 color: HexColor('#A2BAC4'),
//               ),
//               onTap: () {
//                 setState(() {
//                   //Đóng modal tùy chọn
//                   Navigator.of(context).pop(); // force pop
//                   //Hiển thị modal xác nhận xóa
//                   showMaterialModalBottomSheet(
//                     expand: false,
//                     context: context,
//                     backgroundColor: Colors.transparent,
//                     builder: (context) => modalPollInit(),
//                   );
//                 });
//               }),
//           ListTile(
//             title: Text(
//               GlobalVariables.LIST_SERVICE_SUPPEND_NAME,
//               style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//             ),
//             leading: Icon(
//               Icons.stop_circle_outlined,
//               color: HexColor('#A2BAC4'),
//             ),
//             onTap: () => Navigator.of(context).maybePop(),
//           ),
//           ListTile(
//               title: Text(
//                 GlobalVariables.TEXT_DELETE,
//                 style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//               ),
//               leading: Icon(
//                 Icons.delete_rounded,
//                 color: HexColor('#A2BAC4'),
//               ),
//               onTap: () {
//                 setState(() {
//                   //Đóng modal tùy chọn
//                   Navigator.of(context).pop(); // force pop
//                   //Hiển thị modal xác nhận xóa
//                   showMaterialModalBottomSheet(
//                     expand: false,
//                     context: context,
//                     backgroundColor: Colors.transparent,
//                     builder: (context) => modalConfirmDeleteService(),
//                   );
//                 });
//               }),
//         ],
//       ),
//     );
//   }
//
//   Widget modalConfirmDeleteService() {
//     return Container(
//       height: 185,
//       decoration: BoxDecoration(
//         color: HexColor('#325360'),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   GlobalVariables.LIST_SERVICE_CONFIRM_DELETE_NAME,
//                   style: TextStyle(
//                       color: HexColor('#A2BAC4'),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'ayodvtfn.nethost-1511.000nethost.com',
//                   style: TextStyle(
//                       color: HexColor('#A2BAC4'),
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   GlobalVariables.LIST_SERVICE_CONFIRM_DELETE_NAME_HINT,
//                   style: TextStyle(
//                     color: HexColor('#A2BAC4'),
//                     fontSize: 15,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       child: Text(
//                         GlobalVariables.TEXT_CANCEL,
//                         style:
//                             TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).maybePop();
//                       },
//                     ),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(width: 1, color: HexColor('#47ABFF')),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5.0)),
//                       ),
//                       child: Text(
//                         GlobalVariables.TEXT_DELETE,
//                         style:
//                             TextStyle(color: HexColor('#47ABFF'), fontSize: 15),
//                       ),
//                       onPressed: () {
//                         //Đóng modal xác nhận xóa
//                         Navigator.of(context).maybePop();
//                         print('đã xóa service');
//                       },
//                     ),
//                     SizedBox(
//                       width: 12,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget modalPollInit() {
//     return Container(
//       decoration: BoxDecoration(
//         color: HexColor('#325360'),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               'ayodvtfn.nethost-1511.000nethost.com',
//               style: TextStyle(
//                   fontSize: 15,
//                   color: HexColor('#A2BAC4'),
//                   fontWeight: FontWeight.bold),
//             ),
//             onTap: () => Navigator.of(context).maybePop(),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15.0),
//             child: Divider(
//               color: HexColor('#658998'),
//               height: 1,
//             ),
//           ),
//           ListTile(
//             title: Row(
//               children: [
//                 Text(
//                   GlobalVariables.LIST_SERVICE_POLL_INIT,
//                   style: TextStyle(color: HexColor('#A2BAC4'), fontSize: 15),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   Icons.insert_chart_outlined,
//                   color: HexColor('#1FCCB7'),
//                 )
//               ],
//             ),
//             onTap: () => Navigator.of(context).maybePop(),
//           ),
//         ],
//       ),
//     );
//   }
// }
