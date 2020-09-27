#include <stdio.h>

unsigned int clz(unsigned int i)
{
    unsigned int one = 0x80000000;
    unsigned int res = 0;

    for (int cnt = 0; cnt < 32; cnt++) {
        if ((i & one) == 0)
            res++;
        else
            return res;
        one = one >> 1;
    }
    return res;
}

int main()
{
    unsigned int num = 0x0F;
    printf("%d", clz(num));

    return clz(num);
}
