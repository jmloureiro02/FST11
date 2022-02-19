/*
 *  Author: João Loureiro, FST Lisboa
 *
 *  Release date: 2021/12/21
 *
 *  Description: formats text data file to csv format
 *
 *  Version: 1.0
 *
 *  Change log:
 *    1.0 - 2021/12/21
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv){
    FILE *fin, *fout;
    char str[100];
    int ctr2 = 0,ctr1 = 0;

    if((fin = fopen(argv[1], "r")) == NULL) exit(0);
    if((fout = fopen("r1.txt", "w")) == NULL) exit(0);

    while(fscanf(fin,"%s",str) != EOF){
        
        for(int j = 0; str[j] != '\0'; j++)
            if(str[j] == ',') ctr1++;

        if(ctr1 == 3){
            for(int i = 0; str[i] != '\0';i++){

                if(str[i] == ','){
                    if(ctr2 == 1) str[i] = '.';
                    ctr2++;
                }
            }
            ctr2 = 0;
        }
        ctr1 = 0;

        fwrite(str,1,strlen(str),fout);
        fwrite("\n",1,sizeof(char),fout);
    }

    fclose(fin);
    fclose(fout);
}
