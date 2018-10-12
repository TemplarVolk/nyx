part of discord;

class MessageReactionsRemovedEvent {
  Channel channel;
  Message message;
  Map<String, dynamic> raw;

  MessageReactionsRemovedEvent._new(Client client, Map<String, dynamic> json) {
    // this.channel = client.channels[json['d']['channel_id']] as Channel;
    // this.message = client.channels[json['d']['channel_id']].messages[json['d']['id']];

    raw = json;

    client._events.onMessageReactionsRemoved.add(this);
  }
}
