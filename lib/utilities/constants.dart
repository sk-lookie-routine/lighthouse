//기준사이즈
const standardWidth = 360.0;
const standardHeight = 760.0;

//스크린 크기에 맞게 변환된 넓이 얻기
double getWidthtByScreenSize(double screenWidth, double width){
  return screenWidth * width / standardWidth;
}

//스크린 크기에 맞게 변환된 높이 얻기
double getHeightByScreenSize(double screenHeight, double height){
  return screenHeight * height / standardHeight;
}