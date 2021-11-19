extern int a[]; 
extern int n; 
 
int vixl( ) { 
   static int cnt = 0; 
 
   int tmp = a[0]; 
   a[0] = a[n-1]; 
   a[n-1] = tmp; 
 
   return ++cnt; 
}