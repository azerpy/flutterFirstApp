import 'package:m2_app/data/models/ability.dart';

class Abilities {

  Ability ability;
  bool is_hidden;
  int slot;

	Abilities.fromJsonMap(Map<String, dynamic> map): 
		ability = Ability.fromJsonMap(map["ability"]),
		is_hidden = map["is_hidden"],
		slot = map["slot"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ability'] = ability == null ? null : ability.toJson();
		data['is_hidden'] = is_hidden;
		data['slot'] = slot;
		return data;
	}
}
