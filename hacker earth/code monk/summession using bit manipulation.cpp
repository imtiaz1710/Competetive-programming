#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n,sum=0;
    cin>>n;
    int a[n];
    for(int i=0;i<n;i++)
        cin>>a[i];
    for(int i=0;i<32;i++)
    {

        for(int j=0;j<n;j++)
        {
            if(a[j]&(1<<i))
                sum+=(1<<i);
        }
    }
    cout<<sum<<endl;
}
