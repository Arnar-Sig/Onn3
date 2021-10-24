#include<stdbool.h>

int main() {
  int x = 16777217; //16777216 er hæsta mögulega tala í 2^24 í float32, svo það tapast gögn þegar komið erí 16777217
  bool a = (x == (int)(float)x);
  
  if(a == true){
    printf("true");
  }
  else{
    printf("false");
  }
  
  return 0;
}