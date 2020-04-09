import 'package:m2_app/data/models/version.dart';

class Version_details {

  int rarity;
  Version version;

	Version_details.fromJsonMap(Map<String, dynamic> map): 
		rarity = map["rarity"],
		version = Version.fromJsonMap(map["version"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rarity'] = rarity;
		data['version'] = version == null ? null : version.toJson();
		return data;
	}
}
