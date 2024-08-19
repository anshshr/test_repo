import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/circle%20profile/profile/blocs/user_friends/user_friends_bloc.dart';
import 'package:wagwan_work_testing/themes/app_theme.dart';


class FriendsView extends StatelessWidget {
  FriendsView({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userRepository = RepositoryProvider.of<UserRepository>(context);
    final profileRepository = RepositoryProvider.of<ProfileRepository>(context);
    return BlocProvider(
      create: (context) => UserFriendsBloc(
          userRepository: userRepository, profileRepository: profileRepository)
        ..add(FetchUserFriendsEvent()),
      child: BlocConsumer<UserFriendsBloc, UserFriendsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LoadedUserFriendsState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextfield(
                    controller: controller,
                    obscureText: false,
                    textalign: TextAlign.center,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.friendsModel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/default_pfp.jpg'),
                        ),
                        title: Text(
                          state.friendsModel[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: context.theme.appColors.onPrimary),
                        ),
                        subtitle: Text(
                          state.friendsModel[index].bio,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: context.theme.appColors.accent1),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is LoadingUserFriendsState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is UserFriendsErrorState) {
            return const ErrorPage();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
