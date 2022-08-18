// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ngoc_diep_gia_dung/component/empty_image_widget/saha_empty_image.dart';
// import 'package:ngoc_diep_gia_dung/component/loading/loading_container.dart';
//
// class ItemWidget extends StatelessWidget {
//   String? imageUrl;
//   String? title;
//   String? description;
//   Function onTap;
//   ItemWidget({this.imageUrl,this.title, this.description,required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         onTap();
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only
//               (top: 10, left: 10, right: 10),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrl ?? "",
//                     width: 100,
//                     height: 70,
//                     fit: BoxFit.fitWidth,
//                     placeholder: (context, url) => SahaLoadingContainer(
//                       height: 40,
//                       width: 30,
//                     ),
//                     errorWidget: (context, url, error) => Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: SahaEmptyImage(),
//                     ),
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(child: Text(title ?? "", overflow: TextOverflow.ellipsis,)),
//               ],
//             ),
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ItemWidgetVideo extends StatelessWidget {
//   String? imageUrl;
//   String? title;
//   String? description;
//   Function onTap;
//   ItemWidgetVideo({this.imageUrl,this.title, this.description,required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         onTap();
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 10, left: 10, right: 10),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrl ?? "",
//                     width: 80,
//                     height: 60,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => SahaLoadingContainer(
//                       height: 40,
//                       width: 30,
//                     ),
//                     errorWidget: (context, url, error) => Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: SahaEmptyImage(),
//                     ),
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title ?? "", style: TextStyle(
//                       fontWeight: FontWeight.bold
//                     ),),
//                     // if(description!= null)
//                     //   Text(description!,style: TextStyle(fontSize: 13),),
//                   ],
//                 ))
//               ],
//             ),
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }
