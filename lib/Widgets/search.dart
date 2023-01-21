// import 'package:flutter/material.dart';

// class SearchTool extends StatefulWidget {
//   const SearchTool({super.key});

//   @override
//   State<SearchTool> createState() => _SearchToolState();
// }

// class _SearchToolState extends State<SearchTool> {
//   final TextEditingController _searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0, right: 20),
//       child: TextField(
//         controller: _searchController,
//         decoration: InputDecoration(
//           fillColor: Colors.grey,
//           filled: true,
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(width: 0.8, color: Colors.white70),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           hintText: "Search Movies",
//           hintStyle:
//               const TextStyle(height: 0.1, fontSize: 13, color: Colors.white70),
//           prefixIcon: const Icon(
//             Icons.search,
//             color: Colors.white70,
//           ),
//         ),
//       ),
//     );
//   }
// }
