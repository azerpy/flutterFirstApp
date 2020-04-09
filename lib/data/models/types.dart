import 'package:m2_app/data/models/type.dart';

class Types {

  int slot;
  Type type;

	Types.fromJsonMap(Map<String, dynamic> map): 
		slot = map["slot"],
		type = Type.fromJsonMap(map["type"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['slot'] = slot;
		data['type'] = type == null ? null : type.toJson();
		return data;
	}
}
