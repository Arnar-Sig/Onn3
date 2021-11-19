long mitt_switch(long x, long y, long z)
{
    long w = 1;
    switch(x) {
    case 1:
        w = y*z;
        break;
    case 2:
        w = y/z;
        break;
    case 3:
        w += z;
        break;
    case 4:
        w -= z;
        break;
    case 5:
        w *= z;
        break;
    }
    return w;
}
int main(){
    return 0;
}