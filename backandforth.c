#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
void addstr(char *a, char *b);
int is_palindrome(char *s);
int Cis_palindrome(char *s);
int palindrome_check();
int fact(int n);
int factstr(char *s);


int main(){
    bool checker = true;
    char selection[10];
    while (checker){
        printf("1) Add two numbers together\n");
        printf("2) Test if a string is a palindrome (C -> ASM)\n");
        printf("3) Print the factorial of a number\n");
        printf("4) Test if a string is a palindrome (ASM -> C)\n");
        printf("5) End program.\n");
        printf("Enter a number: \n");
        read(0, selection, 10);
        //int count = read(0, buf, 1024);
        if(selection[0] == '1')
        {
            char input1[1024];
            char input2[1024];
            printf("Please enter to first string to add:\n");
            read(0, input1, 100);
            printf("Please enter to second string to add:\n");
            read(0, input2, 100);
            printf("\nThe sum is: ");
            addstr(input1, input2);
            printf("\n\n");

        }
        else if(selection[0] == '2')
        {
            char input3[1024];
            printf("Please enter a string:\n");
            read(0, input3, 100);
            if(is_palindrome(input3)){
                printf("It is a palindrome.\n");
            }
            else{
                printf("it is NOT a palindrome\n");
            }
        }
        else if(selection[0] == '3')
        {
            char input4[1024];
            printf("Please enter an integer:\n");
            read(0, input4, 1024);
            int factorial = factstr(input4);
            printf("%d\n", factorial);
        }
        else if(selection[0] == '4')
        {
            int a = palindrome_check();
            if(a){
                printf("It is a palindrome.\n");
            }
            else{
                printf("it is NOT a palindrome\n");
            }
        }
        else if(selection[0] == '5')
        {
            checker = false;
        }
    }
}

int Cis_palindrome(char *s){
    int i, j;
    char *b = s;
    int len = 0;
    while(*b != 0x0A){ //we know the char* we pass has new line at the end
        len = len + 1;
        b = &s[len];
    }

    for (i = 0, j = len - 1; i < len/2; i++, j--){
        if (s[i] != s[j]){
             return 0;
        }
    }
    return 1;
}

int fact(int n){
    if (n == 0){
        return 1;
    }
    else{
        return (n*fact(n-1));
    }
}