//  abdullah.ahmed0@gmail.com

import '../Network/local/shared_preferences.dart';
import '../generated/assets.dart';

List<String> AvatarValues = [
 Assets.imagesSonicTest,
 Assets.imagesDoctorAvatar3,
 Assets.imagesManAvatar2,
 Assets.imagesWomanTest1,
 Assets.imagesManTest,
 Assets.imagesWomanTest2,
 Assets.imagesTest2,
 Assets.imagesTest2,
 Assets.imagesTest2,


];

int indexs = -1;
bool chooseAvatar = false;
int cont = 0;
var NameV = CacheHelper.getData(key: "Name");
