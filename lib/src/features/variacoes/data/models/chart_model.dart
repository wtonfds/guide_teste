import 'package:guide_ti/src/features/variacoes/domain/entities/chart_entity.dart';

class ChartModel implements ChartEntity {

  @override
  double? open;

  ChartModel({
    this.open,
  });

  ChartModel.fromJson(Map<String, dynamic> json){
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['open'] = open;
    return _data;
  }

  static ChartModel fromMap(Map<String, dynamic> map){
    return ChartModel(
      open: map['open'],
    );
  }
}
