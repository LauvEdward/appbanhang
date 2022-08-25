// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductHiveAdapter extends TypeAdapter<ProductHive> {
  @override
  final int typeId = 0;

  @override
  ProductHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductHive()
      ..id = fields[0] as String?
      ..style = fields[1] as Null?
      ..idValue = fields[2] as Null?
      ..brand = fields[3] as String?
      ..name = fields[4] as String?
      ..code = fields[5] as String?
      ..image = fields[6] as String?
      ..hot = fields[7] as String?
      ..home = fields[8] as String?
      ..focus = fields[9] as String?
      ..coupon = fields[10] as String?
      ..view = fields[11] as String?
      ..active = fields[12] as String?
      ..price = fields[13] as String?
      ..priceSale = fields[14] as String?
      ..description = fields[15] as String?
      ..location = fields[16] as Null?
      ..like = fields[17] as String?
      ..order = fields[18] as String?
      ..categoryId = fields[19] as String?
      ..caption1 = fields[20] as Null?
      ..caption2 = fields[21] as Null?
      ..locale = fields[22] as String?
      ..bought = fields[23] as Null?
      ..dksudung = fields[24] as Null?
      ..sort = fields[25] as String?
      ..quantity = fields[26] as String?
      ..counter = fields[27] as Null?
      ..lang = fields[28] as String?
      ..destination = fields[29] as Null?
      ..contents = fields[30] as String?
      ..time = fields[31] as String?
      ..tags = fields[32] as Null?
      ..proDir = fields[33] as dynamic
      ..multiImage = fields[34] as Null?
      ..imgDir = fields[35] as Null?
      ..status = fields[36] as String?
      ..quaranty = fields[37] as Null?
      ..tinhtrang = fields[38] as Null?
      ..groupAttributeId = fields[39] as Null?
      ..color = fields[40] as Null?
      ..size = fields[41] as Null?
      ..userId = fields[42] as String?
      ..optionId = fields[43] as Null?
      ..buttonColor1 = fields[44] as String?
      ..configProContent = fields[45] as String?
      ..weight = fields[46] as Null?
      ..priceImp = fields[47] as Null?
      ..timeUpdate = fields[48] as String?
      ..combo = fields[49] as String?
      ..productDvtId = fields[50] as String?;
  }

  @override
  void write(BinaryWriter writer, ProductHive obj) {
    writer
      ..writeByte(51)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.style)
      ..writeByte(2)
      ..write(obj.idValue)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.code)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.hot)
      ..writeByte(8)
      ..write(obj.home)
      ..writeByte(9)
      ..write(obj.focus)
      ..writeByte(10)
      ..write(obj.coupon)
      ..writeByte(11)
      ..write(obj.view)
      ..writeByte(12)
      ..write(obj.active)
      ..writeByte(13)
      ..write(obj.price)
      ..writeByte(14)
      ..write(obj.priceSale)
      ..writeByte(15)
      ..write(obj.description)
      ..writeByte(16)
      ..write(obj.location)
      ..writeByte(17)
      ..write(obj.like)
      ..writeByte(18)
      ..write(obj.order)
      ..writeByte(19)
      ..write(obj.categoryId)
      ..writeByte(20)
      ..write(obj.caption1)
      ..writeByte(21)
      ..write(obj.caption2)
      ..writeByte(22)
      ..write(obj.locale)
      ..writeByte(23)
      ..write(obj.bought)
      ..writeByte(24)
      ..write(obj.dksudung)
      ..writeByte(25)
      ..write(obj.sort)
      ..writeByte(26)
      ..write(obj.quantity)
      ..writeByte(27)
      ..write(obj.counter)
      ..writeByte(28)
      ..write(obj.lang)
      ..writeByte(29)
      ..write(obj.destination)
      ..writeByte(30)
      ..write(obj.contents)
      ..writeByte(31)
      ..write(obj.time)
      ..writeByte(32)
      ..write(obj.tags)
      ..writeByte(33)
      ..write(obj.proDir)
      ..writeByte(34)
      ..write(obj.multiImage)
      ..writeByte(35)
      ..write(obj.imgDir)
      ..writeByte(36)
      ..write(obj.status)
      ..writeByte(37)
      ..write(obj.quaranty)
      ..writeByte(38)
      ..write(obj.tinhtrang)
      ..writeByte(39)
      ..write(obj.groupAttributeId)
      ..writeByte(40)
      ..write(obj.color)
      ..writeByte(41)
      ..write(obj.size)
      ..writeByte(42)
      ..write(obj.userId)
      ..writeByte(43)
      ..write(obj.optionId)
      ..writeByte(44)
      ..write(obj.buttonColor1)
      ..writeByte(45)
      ..write(obj.configProContent)
      ..writeByte(46)
      ..write(obj.weight)
      ..writeByte(47)
      ..write(obj.priceImp)
      ..writeByte(48)
      ..write(obj.timeUpdate)
      ..writeByte(49)
      ..write(obj.combo)
      ..writeByte(50)
      ..write(obj.productDvtId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
