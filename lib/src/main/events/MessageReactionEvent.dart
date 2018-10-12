part of discord;

/// Emitted when a user adds a reaction to a message.
class MessageReactionEvent {
  /// User who fired event
  User user;

  /// Channel on which event was fired
  Channel channel;

  /// Message to which emojis was added
  Message message;

  String emoji;

  Map<String, dynamic> raw;

  MessageReactionEvent._new(
      Client client, Map<String, dynamic> json, bool added) {
    // this.user = client.users[json['d']['user_id']];
    // this.channel = client.channels[json['d']['channel_id']] as Channel;
    // this.message = client.channels[json['d']['channel_id']].messages[json['d']['id']];

    raw = json;

    emoji = json['d']['emoji']['name'];
    client._events.onMessageReaction.add(this);
  }
}
