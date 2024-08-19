import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagwan_work_testing/circle%20profile/profile/blocs/friend_request/friend_request_bloc.dart';
import 'package:wagwan_work_testing/circle%20profile/profile/repositories/profile_repo.dart';

class FriendRequests extends StatelessWidget {
  const FriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    var profileRepository = RepositoryProvider.of<ProfileRepository>(context);
    return BlocProvider(
      create: (context) =>
          FriendRequestBloc(profileRepository: profileRepository)
            ..add(FetchPendingFriendRequestsEvent()),
      child: BlocConsumer<FriendRequestBloc, FriendRequestState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadedFriendRequestState) {
            return Scaffold(
              body: ListView.builder(
                itemCount: state.friends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?cs=srgb&dl=pexels-didsss-3844788.jpg&fm=jpg'),
                    ),
                    title: Text(
                      state.friends[index].name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          // TODO : change this button
                          onPressed: () {
                            // Accept Logic
                            context
                                .read<FriendRequestBloc>()
                                .add(AcceptFriendRequestEvent(
                                  friendRequestId: state.friends[index].id,
                                  friendUserId: state.friends[index].friendId,
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Text(
                            'Accept',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          // TODO : change this button
                          onPressed: () {
                            // Reject Logic
                            context.read<FriendRequestBloc>().add(
                                  RejectFriendRequestEvent(
                                    friendRequestId: state.friends[index].id,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: Text(
                            'Reject',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is LoadingFriendRequestState) {
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
