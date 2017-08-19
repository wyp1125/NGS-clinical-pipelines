#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string.h>
#include <stdio.h>
#include <stdlib.h> 
#include <algorithm>
using namespace std;
struct pos
{
string chr;
long int sta;
long int end;
string record;
bool operator < (const pos &g) const
    {
        return (chr == g.chr && sta == g.sta && end < g.end) || (chr == g.chr && sta < g.sta) || chr < g.chr;
    }
};
vector <pos> gene;
void read_file(char *file)
{
ifstream in;
in.open(file);
string line, word;
while (!in.eof())
{
        getline(in,line);
        if (line=="")
            break;
        pos temp;
        temp.record=line;
        istringstream test(line);
        getline(test,word,'\t');
        temp.chr=word;
        getline(test,word,'\t');
        temp.sta=atoi(word.c_str());
        getline(test,word,'\t');
        temp.end=atoi(word.c_str());
        gene.push_back(temp);
}
sort(gene.begin(), gene.end());
}
void output(char *file)
{
ofstream out;
out.open(file,ios::out);
for(int i=0;i<gene.size();i++)
{
out<<gene[i].record<<endl;
}
}
int main(int argc, char *argv[])
{
if(argc<=2)
{
cout<<"Usage: input output"<<endl;
exit(1);
}
read_file(argv[1]);
output(argv[2]);
return 1;
}
