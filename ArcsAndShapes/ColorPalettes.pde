color[] TravelerPallete = {#C1CDDC, #516EBC, #00529C, #153477, #050F2B};
color[] BleedingTiger = {#F9E3B8, #EBB85D, #DB9501, #D26500, #25251B, #7E2E37, #f0f0f0};
color[] BeachBall = {#E53D00, #FFE900, #FCFFF7, #21A0A0, #046865};
color[] Tropical = {#FF5E5B, #D8D8D8, #FFFFEA, #00CECB, #FFED66};
color[] JustBlack = {#000000};
color[] PortraitOfALadyOnFire = {#30525A,#7C837B,#907E6E,#163439,#F7EFE9,#805F52};
color[] BeastsOfNoNation = {#00343F, #005A6A, #98C0BE, #BBADAD, #A87480, #B14C6A, #711522, #412521};
color[] ApocalypseNow = {#24130C, #BF4700, #F07800, #EFB178, #CCECEB, #7FCCD6, #00657F, #01A491};

color getColor(float step, color[] colors) {
    
  float scaledStep = step * colors.length;
  int colorIndex1 = step == 1 ? colors.length - 1 : floor(scaledStep);
  int colorIndex2 = step == 1 ? 0 : (colorIndex1 == colors.length-1) ? 0 : colorIndex1 + 1;
  float amt = scaledStep - colorIndex1;
  
  return lerpColor(colors[colorIndex1], colors[colorIndex2], amt);
}


color getColor(float step, color[] colors, float noiseValue) {
    
  float scaledStep = noiseValue;
  int colorIndex1 = step == 1 ? colors.length - 1 : floor(scaledStep);
  int colorIndex2 = step == 1 ? 0 : (colorIndex1 == colors.length-1) ? 0 : colorIndex1 + 1;
  float amt = scaledStep - colorIndex1;
  
  return lerpColor(colors[colorIndex1], colors[colorIndex2], amt);
}
