import 'package:flutter/material.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget();
 
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MovieDetailsViewModel>();
 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Summary", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(vm.synopsisDisplay, style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.6)),
          if (vm.canExpand)
            GestureDetector(
              onTap: vm.toggleExpanded,
              child: Text(
                vm.isExpanded ? "Read Less" : "Read More",
                style: const TextStyle(color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
  }
}
 