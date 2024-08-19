class FriendRequestModel {
  final String id;
  final String friendId;
  final FriendRequestStatus status;
  final String name;
  final String bio;
  final String profileURL;

  FriendRequestModel({
    required this.id,
    required this.friendId,
    required this.status,
    required this.name,
    required this.bio,
    required this.profileURL,
  });
}

enum FriendRequestStatus { pending, accepted, rejected }
