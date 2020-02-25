# MOL
Sends email with information about the logged in user whenever a mikrotik is logged in
# 1. SENDER CONFIGURATION
First we need to configure the sender email, you can do this in / tool email:
> ![image](https://user-images.githubusercontent.com/35925546/75244792-321ce500-57ab-11ea-91e9-b56d2018b81e.png)

# 2. Scheduller creation

Now we need to create a scheduler, which starts whenever mikrotik is started, We can do this manually or with a command.

## 2.1 Command:
> /system scheduler
add name=startup on-event=MOL policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-time=startup

## 2.2 Manually
If you do step 2.1, you don't have to do that!

on /system scheduler configure as shown in the image
> ![image](https://user-images.githubusercontent.com/35925546/75245603-cdfb2080-57ac-11ea-94df-f4ed4e81abb5.png)

# 3. Script Configuration

> First, we need to create a script in / system script, with the name of MOL
> ![image](https://user-images.githubusercontent.com/35925546/75246640-f4ba5680-57ae-11ea-9899-e1a50551a6de.png)
>
>As a code we will use the MOL.RSC file from this same GIT. You can insert the complete code.
>The only editing you need to do is from the sender.
>You can change the sender on line 20 of the code:
>'/tool e-mail send to="DESTINATION_EMAIL" subject=("usuario(s) logados data/hora ".[/system clock get date]." ".[/system clock get time]." mikrotik ".[/system identity get name]) body=$tmpMessage;'
