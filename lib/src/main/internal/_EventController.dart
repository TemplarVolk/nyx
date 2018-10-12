part of discord;

/// A controller for all events.
class _EventController {
  /// Emitted when a raw packet is received from the websocket connection.
  StreamController<RawEvent> onRaw;

  /// Emitted when a shard is disconnected from the websocket.
  StreamController<DisconnectEvent> onDisconnect;

  /// Emitted before all HTTP requests are sent. (You can edit them)
  ///
  /// **WARNING:** Once you listen to this stream, all requests
  /// will be halted until you call `request.send()`
  StreamController<BeforeHttpRequestSendEvent> beforeHttpRequestSend;

  /// Emitted when a successful HTTP response is received.
  StreamController<HttpResponseEvent> onHttpResponse;

  /// Emitted when a HTTP request failed.
  StreamController<HttpErrorEvent> onHttpError;

  /// Sent when the client is ratelimited, either by the ratelimit handler itself,
  /// or when a 429 is received.
  StreamController<RatelimitEvent> onRatelimited;

  /// Emitted when the client is ready.
  StreamController<ReadyEvent> onReady;

  /// Emitted when a message is received.
  StreamController<MessageEvent> onMessage;

  /// Emitted when a message is edited.
  StreamController<MessageUpdateEvent> onMessageUpdate;

  /// Emitted when a reaction is created.
  StreamController<MessageReactionEvent> onMessageReaction;

  /// Emitted when a reaction is removed.
  StreamController<MessageReactionsRemovedEvent> onMessageReactionsRemoved;

  /// Emitted when a message is edited.
  StreamController<MessageDeleteEvent> onMessageDelete;

  /// Emitted when a channel is created.
  StreamController<ChannelCreateEvent> onChannelCreate;

  /// Emitted when a channel is updated.
  StreamController<ChannelUpdateEvent> onChannelUpdate;

  /// Emitted when a channel is deleted.
  StreamController<ChannelDeleteEvent> onChannelDelete;

  /// Emitted when a member is banned.
  StreamController<GuildBanAddEvent> onGuildBanAdd;

  /// Emitted when a user is unbanned.
  StreamController<GuildBanRemoveEvent> onGuildBanRemove;

  /// Emitted when the client joins a guild.
  StreamController<GuildCreateEvent> onGuildCreate;

  /// Emitted when a guild is updated..
  StreamController<GuildUpdateEvent> onGuildUpdate;

  /// Emitted when the client leaves a guild.
  StreamController<GuildDeleteEvent> onGuildDelete;

  /// Emitted when a guild becomes unavailable.
  StreamController<GuildUnavailableEvent> onGuildUnavailable;

  /// Emitted when a member joins a guild.
  StreamController<GuildMemberAddEvent> onGuildMemberAdd;

  /// Emitted when a member is updated.
  StreamController<GuildMemberUpdateEvent> onGuildMemberUpdate;

  /// Emitted when a user leaves a guild.
  StreamController<GuildMemberRemoveEvent> onGuildMemberRemove;

  /// Emitted when a member's presence is updated.
  StreamController<PresenceUpdateEvent> onPresenceUpdate;

  /// Emitted when a user starts typing.
  StreamController<TypingEvent> onTyping;

  /// Emitted when a role is updated.
  StreamController<RoleCreateEvent> onRoleCreate;

  /// Emitted when a role is created.
  StreamController<RoleUpdateEvent> onRoleUpdate;

  /// Emitted when a role is deleted.
  StreamController<RoleDeleteEvent> onRoleDelete;

  /// Makes a new `EventController`.
  _EventController(Client client) {
    this.onRaw = new StreamController.broadcast();
    client.onRaw = this.onRaw.stream;

    this.onDisconnect = new StreamController.broadcast();
    client.onDisconnect = this.onDisconnect.stream;

    this.beforeHttpRequestSend = new StreamController.broadcast();
    client.beforeHttpRequestSend = this.beforeHttpRequestSend.stream;

    this.onHttpResponse = new StreamController.broadcast();
    client.onHttpResponse = this.onHttpResponse.stream;

    this.onHttpError = new StreamController.broadcast();
    client.onHttpError = this.onHttpError.stream;

    this.onRatelimited = new StreamController.broadcast();
    client.onRatelimited = this.onRatelimited.stream;

    this.onReady = new StreamController.broadcast();
    client.onReady = this.onReady.stream;

    this.onMessage = new StreamController.broadcast();
    client.onMessage = this.onMessage.stream;

    this.onMessageUpdate = new StreamController.broadcast();
    client.onMessageUpdate = this.onMessageUpdate.stream;

    this.onMessageReaction = new StreamController.broadcast();
    client.onMessageReaction = this.onMessageReaction.stream;

    this.onMessageReactionsRemoved = new StreamController.broadcast();
    client.onMessageReactionsRemoved = this.onMessageReactionsRemoved.stream;

    this.onMessageDelete = new StreamController.broadcast();
    client.onMessageDelete = this.onMessageDelete.stream;

    this.onChannelCreate = new StreamController.broadcast();
    client.onChannelCreate = this.onChannelCreate.stream;

    this.onChannelUpdate = new StreamController.broadcast();
    client.onChannelUpdate = this.onChannelUpdate.stream;

    this.onChannelDelete = new StreamController.broadcast();
    client.onChannelDelete = this.onChannelDelete.stream;

    this.onGuildBanAdd = new StreamController.broadcast();
    client.onGuildBanAdd = this.onGuildBanAdd.stream;

    this.onGuildBanRemove = new StreamController.broadcast();
    client.onGuildBanRemove = this.onGuildBanRemove.stream;

    this.onGuildCreate = new StreamController.broadcast();
    client.onGuildCreate = this.onGuildCreate.stream;

    this.onGuildUpdate = new StreamController.broadcast();
    client.onGuildUpdate = this.onGuildUpdate.stream;

    this.onGuildDelete = new StreamController.broadcast();
    client.onGuildDelete = this.onGuildDelete.stream;

    this.onGuildUnavailable = new StreamController.broadcast();
    client.onGuildUnavailable = this.onGuildUnavailable.stream;

    this.onGuildMemberAdd = new StreamController.broadcast();
    client.onGuildMemberAdd = this.onGuildMemberAdd.stream;

    this.onGuildMemberUpdate = new StreamController.broadcast();
    client.onGuildMemberUpdate = this.onGuildMemberUpdate.stream;

    this.onGuildMemberRemove = new StreamController.broadcast();
    client.onGuildMemberRemove = this.onGuildMemberRemove.stream;

    this.onPresenceUpdate = new StreamController.broadcast();
    client.onPresenceUpdate = this.onPresenceUpdate.stream;

    this.onTyping = new StreamController.broadcast();
    client.onTyping = this.onTyping.stream;

    this.onRoleCreate = new StreamController.broadcast();
    client.onRoleCreate = this.onRoleCreate.stream;

    this.onRoleUpdate = new StreamController.broadcast();
    client.onRoleUpdate = this.onRoleUpdate.stream;

    this.onRoleDelete = new StreamController.broadcast();
    client.onRoleDelete = this.onRoleDelete.stream;
  }

  /// Closes all streams.
  Future<Null> destroy() async {
    await this.onRaw.close();
    await this.onDisconnect.close();
    await this.beforeHttpRequestSend.close();
    await this.onHttpResponse.close();
    await this.onHttpError.close();
    await this.onRatelimited.close();
    await this.onGuildUpdate.close();
    await this.onReady.close();
    await this.onMessage.close();
    await this.onMessageUpdate.close();
    await this.onMessageReaction.close();
    await this.onMessageReactionsRemoved.close();
    await this.onMessageDelete.close();
    await this.onChannelCreate.close();
    await this.onChannelUpdate.close();
    await this.onChannelDelete.close();
    await this.onGuildBanAdd.close();
    await this.onGuildBanRemove.close();
    await this.onGuildCreate.close();
    await this.onGuildUpdate.close();
    await this.onGuildDelete.close();
    await this.onGuildUnavailable.close();
    await this.onGuildMemberAdd.close();
    await this.onGuildMemberUpdate.close();
    await this.onGuildMemberRemove.close();
    await this.onPresenceUpdate.close();
    await this.onTyping.close();
    await this.onRoleCreate.close();
    await this.onRoleUpdate.close();
    await this.onRoleDelete.close();
    return null;
  }
}
