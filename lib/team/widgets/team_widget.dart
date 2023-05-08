//  Container(
//         height: 100,
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             gradient: const LinearGradient(
//                 colors: [AppColors.pinkColor, AppColors.lightPurpleColor])),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/unlock2.png',
//                       width: 100,
//                       height: 80,
//                       fit: BoxFit.cover,
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       's',
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'team.captain',
//                       style: const TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage('assets/images/unlock2.png'),
//             )
//           ],
//         ),
//       ),