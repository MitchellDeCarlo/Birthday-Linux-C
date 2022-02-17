#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pwd.h>
#include <unistd.h>
 
 
int main(int argc, char *argv[])
{
    int uid;
    int c;
    uid = geteuid ();
    struct passwd *pw = getpwuid (uid);
    struct tm *local;
    time_t now = time(NULL);
    char *date_now = ctime(&now);
    printf("Hello %s\n",pw->pw_name);
     if(argc >= 2){
     	long int incr = atoi(argv[1]);
     	if(incr < -25550 || incr > 25550){
     		printf("Cannot offest more than 70 years.\n");
     		local = localtime(&now); 
    		printf("Today is %s", asctime(local));
     	}
     	else{
    		long int val = incr * 86400;
    		long int var = now;
    		long int new_var = var + val;
    		time_t new = new_var;
    		local = localtime(&new);
    		printf("Offset by %s days, the date is %s",argv[1],asctime(local));
    	}
    }
    else{
    	local = localtime(&now); 
    	printf("Today is %s", asctime(local));
    }
    int bday,bmonth;
    
    printf("Enter your day of birth (DD): ");
    scanf("%d",&bday);
    
    while(bday< 1 || bday > 31){
    	printf("Not a valid day\n");
    	printf("Enter your day of birth (DD): ");
    	scanf("%d",&bday);
    }
    
    printf("Enter your month of birth (MM): ");
    scanf("%d",&bmonth);
    
    
    while(bmonth< 1 || bmonth > 12){
    	printf("Not a valid month\n");
    	printf("Enter your month of birth (MM): ");
    	scanf("%d",&bmonth);
    }
    
    int dd = local->tm_yday;
    struct tm b;
    b.tm_year = local->tm_year;
    b.tm_mon = bmonth-1;
    b.tm_min = local->tm_min;
    b.tm_sec = local->tm_sec;
    b.tm_hour = local->tm_hour;
    b.tm_mday = bday;
    time_t new_time = mktime(&b);
    struct tm *bnew = localtime(&new_time);
    
    if(bnew->tm_yday < dd){
    	int neww = (365 - dd);
    	printf("There are %d days till your birthday!",(bnew->tm_yday+neww));
    }
    else if( (bnew->tm_yday - dd) == 0 ){
    	printf("Today is your birthday!!");
    }
    else if (dd < bnew->tm_yday){
    	printf("There are %d days till your birthday!",(bnew->tm_yday - dd));
    }
    return 0;
}