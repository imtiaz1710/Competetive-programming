#include <bits/stdc++.h>
#define fin freopen("/home/imtiaz/Desktop/in.txt", "r", stdin)
#define fout freopen("/home/imtiaz/Desktop/out.txt","w", stdout)
#define dbg(x) cerr << #x << ": " << x << endl
#define fastio ios::sync_with_stdio (false); cin.tie (0);

#define ll long long
#define US unsigned short int
#define MP make_pair
#define FF first
#define SS second
#define MOD (1000000000+7)
#define PLL pair<ll,ll>

#define PB push_back
#define LN cout<<"\n"
#define YES cout<<"YES\n"
#define NO cout<<"NO\n"
#define IN(x) cin>>x
#define INN(x,y) cin>>x>>y
#define OU(y) cout<<y<<" "
#define OUT(x) cout<<x<<"\n"
#define OUTT(x,y) cout<<x<<" "<<y<<"\n" 

#define min3(a,b,c)     min(a,min(b,c))
#define max3(a,b,c)     max(a,max(b,c))
#define min4(a,b,c,d)   min(a,min(b,min(c,d)))
#define max4(a,b,c,d)   max(a,max(b,max(c,d)))

#define FOR(i,a,b)      for(int i=a;i<=b;i++)
#define ROF(i,a,b)      for(int i=a;i>=b;i--)
#define REP(i,b)        for(int i=0;i<b;i++)
#define MEM(a,x)        memset(a,x,sizeof(a))
#define ABS(x)          ((x)<0?-(x):(x))
#define SORT(v)         sort(v.begin(),v.end())
#define REV(v)          reverse(v.begin(),v.end())
#define AI(v)           for(ll &tmp:v) cin>>tmp
#define AO(v)           for(ll tmp:v) cout<<tmp<<" "

using namespace std;

ll dr[]={-1, 1, 0, 0, -1, 1, -1, 1};
ll dc[]={0, 0, -1, 1, -1, -1, 1, 1};


int main(){
    ll n,m,k;
    INN(n,m);
    IN(k);
    vector <ll> a(n);
    vector <ll> b(n);
    for (ll i = 0; i < n; i++)
    {
        cin>>a[i];
    }
    b=a;
    map<ll,ll> mp;
    sort(b.rbegin(),b.rend());
    ll need=m*k;
    ll sum=0;
    for (ll i = 0; i < need; i++)
    {
        mp[b[i]]++;
        sum+=b[i];
    }
    ll cnt=0;
    vector <ll> res;
    for (ll i = 0; i < n; i++)
    {
        if(mp[a[i]]){
            cnt++;
            mp[a[i]]--;
        }
        if(cnt==m){
            res.push_back(i+1);
            cnt=0;
        }

    }
    OUT(sum);
    for (ll i = 0; i < k-1; i++)
    {
        OU(res[i]);
    }
    LN;
    
    return 0;
}