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
 Assets.imagesSoonBlack,
 Assets.imagesSoonBlack,
 Assets.imagesSoonBlack,

];
List<String> ageRanges = [
 'Select Age',
 'Under 10',
 '11',
 '12',
 '13',
 '14',
 '15',
 '16',
 '17',
 '18',
 '19',
 '20',
 '21',
 '22',
 '23',
 '24',
 '25',
 '26',
 '27',
 '28',
 '29',
 '30',
 'Over 30',
];

int indexs = -1;
bool chooseAvatar = false;
int cont = 0;
var NameV = CacheHelper.getData(key: "Name");
String selectedAge = "Select Age";
