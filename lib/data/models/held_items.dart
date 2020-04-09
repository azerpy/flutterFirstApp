import 'package:m2_app/data/models/item.dart';
import 'package:m2_app/data/models/version_details.dart';

class Held_items {

  Item item;
  List<Version_details> version_details;

	Held_items.fromJsonMap(Map<String, dynamic> map): 
		item = Item.fromJsonMap(map["item"]),
		version_details = List<Version_details>.from(map["version_details"].map((it) => Version_details.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['item'] = item == null ? null : item.toJson();
		data['version_details'] = version_details != null ? 
			this.version_details.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
