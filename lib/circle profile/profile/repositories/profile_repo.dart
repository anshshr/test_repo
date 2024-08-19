import 'package:flutter/material.dart';


class ProfileRepository {
  final FriendsServiceClient friendsServiceClient;

  ProfileRepository({
    required this.friendsServiceClient,
  });

  Future<List<FriendsModel>> fetchUserFriends() async {
    try {
      List<FriendsModel> friends = [];
      final getUserFriendRequest = GetUserFriendsRequest();

      GetUserFriendsResponse x =
          await friendsServiceClient.getUserFriends(getUserFriendRequest);
      for (var i in x.friends) {
        friends.add(FriendsModel(
          name: i.name,
          bio: i.bio,
          profileUrl: i.profilePicUrl,
          userId: i.userId,
        ));
      }
      return friends;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }

  Future<List<FriendRequestModel>> fetchPendingFriendRequests() async {
    try {
      List<FriendRequestModel> friendRequests = [];
      final getPendingFriendRequest = PendingFriendRequest();
      PendingFriendResponse x =
          await friendsServiceClient.pendingFriend(getPendingFriendRequest);

      for (var i in x.friendRequests) {
        friendRequests.add(
          FriendRequestModel(
            id: i.friendReqId,
            friendId: i.friend.userId,
            status: FriendRequestStatus.values[i.status.value],
            bio: i.friend.bio,
            name: i.friend.name,
            profileURL: i.friend.profilePicUrl,
          ),
        );
      }

      return friendRequests;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<void> acceptFriendRequest(
      String friendRequestId, String friendUserId) async {
    try {
      final acceptFriendRequest = AcceptFriendRequest();
      acceptFriendRequest.friendReqUuid = friendRequestId;
      acceptFriendRequest.friendId = friendUserId;
      await friendsServiceClient.acceptFriend(acceptFriendRequest);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> rejectFriendRequest(String friendRequestId) async {
    try {
      final rejectFriendRequest = RejectFriendRequest();
      rejectFriendRequest.friendReqUuid = friendRequestId;
      await friendsServiceClient.rejectFriend(rejectFriendRequest);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
