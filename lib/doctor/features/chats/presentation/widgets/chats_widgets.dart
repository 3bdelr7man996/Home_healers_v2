import 'package:dr/doctor/features/chats/presentation/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'ابحث عما تريد هنا',
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 16.0),
      onChanged: (name) {
        context.read<ChatsCubit>().searchConversation(name: name);
      },
      onFieldSubmitted: (name) {
        context.read<ChatsCubit>().searchConversation(name: name);
      },
    );
  }
}
