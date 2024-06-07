import 'package:objectbox/objectbox.dart'
    if (dart.library.html) 'package:sellina/objectbox_stubs.dart';

@Entity()
class OutletMappingChannelV1 {
  @Id()
  int id = 0;
  String channel;
  String subChannelV1;

  OutletMappingChannelV1({
    required this.channel,
    required this.subChannelV1,
  });

  Map<String, dynamic> toMap() {
    return {
      'channel': channel,
      'subChannel': subChannelV1,
    };
  }

  factory OutletMappingChannelV1.fromMap(Map<String, dynamic> data) {
    var outletMappingChannel = OutletMappingChannelV1(
        channel: data["channelCode"], subChannelV1: data["channelName"]);
    return outletMappingChannel;
  }
}
