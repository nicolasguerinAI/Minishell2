#!/bin/bash

i=0
red=`tput setaf 1`
white=`tput setaf 7`

echo -n "make re" | make re
echo -n "reset" | reset

echo -n "Setenv and Unsetenv: " ; echo -e "unsetenv abc \n setenv abc lol \n setenv toto \n setenv tyty toto \n unsetenv toto tyty \n setenv abc moomoo \n setenv a moomoo\n setenv b Jairesisteauko \n setenv abc Jairesisteauko\n setenv" |./mysh 2>&1 | grep -i abc=Jairesisteauko >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "Simple exec: " ; echo -e "mkdir toto \n ls -l " |./mysh 2>&1 | grep -i toto >/dev/null ;
if [ $? -eq 0 ];
          then echo ">OK"  &i=$((i+1));
          else echo  "${red}KO${white}";
fi
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo "exit 10:" ;echo -e "/bin/ls -la \n mkdir toto \n cd toto \n ls -la \n cd \n exit 10" |./mysh > titi 2>&1; echo "$?" | grep -i 10 >/dev/null;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf toto" | rm -rf toto
echo -e "rm -rf titi" | rm -rf titi

sleep 0.1

echo "../bin/ls :" ; echo -e "mkdir toto \n ../bin/ls -l " |./mysh > titi 2>&1 | grep -i toto titi ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK"  &i=$((i+1));
fi
echo -e "rm -rf toto" | rm -rf toto
echo -e "rm -rf titi" | rm -rf toto

sleep 0.1

echo "cd and ls" ; echo -e "mkdir toto \n cd toto \n mkdir cd \n ls -la" |./mysh 2>&1| grep -i cd >/dev/null;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo -n "exit 23: " ; echo -e "exit 23" |./mysh 2>&1; echo "$?" | grep -i 23 >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "exit 100: " ; echo -e "exit 100" |./mysh 2>&1; echo "$?" | grep -i 100 >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "simple exit: " ; echo -e "exit" |./mysh 2>&1; echo "$?" | grep -i 0 >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "exit 50: " ; echo -e "exit 50" |./mysh 2>&1 ; echo "$?" | grep -i 50 >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "cd: " ; echo -e "cd \n cd -\n cd \n cd /home/ \n cd / \n cd - \n cd .. \n cd bin\n ls " |./mysh 2>&1 | grep -i ls >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "Setenv and Unsetenv: " ; echo -e "unsetenv abc \n setenv abc lol \n setenv toto \n setenv tyty toto \n unsetenv toto tyty \n setenv abc moomoo \n env \n" |./mysh 2>&1 | grep -i abc=moomoo >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "unsetenv , setenv : " ; echo -e "unsetenv abc \n setenv abc lol \n setenv toto \n setenv tyty toto \n unsetenv toto tyty \n setenv abc moomoo \n setenv a moomoo\n setenv b Jairesisteauko \n setenv abc Jairesisteauko\n setenv" |./mysh 2>&1 | grep -i abc=Jairesisteauko >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "unsetenv , setenv: " ; echo -e "setenv PATHS /bin \n unsetenv PATH \n setenv PATH /bin: \n setenv" |./mysh 2>&1 | grep -i PATH=/bin: >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo "unsetenv , setenv and exec :" ;echo -e " setenv P \n setenv PAT \n setenv PATHS \n unsetenv \n unsetenv PATH \n mkdir toto\n ls" |./mysh 2>&1 > titi | grep -i toto titi ;
if [ $? -eq 0 ] ;
         then echo "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi
echo -e "rm -rf toto" | rm -rf toto
echo -e "rm -rf titi" | rm -rf titi

sleep 0.1

echo -n "Segfault : " ; echo "int main;" > /tmp/test$$.c ; gcc -o /tmp/test$$ /tmp/test$$.c 2>/dev/null ; echo "/tmp/test$$" | ./mysh 2>&1 | grep -i Segmentation >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "Floating : " ; echo "int main() {int a=3; a=a/0;}" > /tmp/test$$.c ; gcc -o /tmp/test$$ /tmp/test$$.c 2>/dev/null ; echo "/tmp/test$$" | ./mysh 2>&1 | grep -i floating >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "Path exec : "
echo -e "mkdir toto \n /ls \n" |./mysh 2>&1 | grep -i toto >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi

sleep 0.1

echo -n "exec : "
echo -e "cd /bin/ \n ./ls \n" |./mysh 2>&1 | grep -i ls >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "exec : "
echo -e "cd /bin/ \n ls \n" |./mysh 2>&1 | grep -i ls >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi

sleep 0.1

echo -n "exec : "
echo -e "cp /bin/ls my_ls \n ./my_ls \n " |./mysh 2>&1 | grep -i my_ls >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf my_ls" | rm -rf my_ls
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo -n "exec : "
echo -e "cd / \n cd /bin \n ./ls" |./mysh 2>&1| grep -i ls >/dev/null ;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf my_ls" | rm -rf my_ls
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo "setenv PATH= and exec :" ; echo -e "setenv PATH= \n mkdir toto \n ls -l \n" | ./mysh > /dev/null 2>&1 | cat /dev/null | grep -i toto >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo "unsetenv, setenv with params and exec :" ; echo -e "unsetenv PATH \n setenv PATH /bin:/dev/urandom\n mkdir toto \n rm -Rf toto \n ls -l " | ./mysh > /dev/null 2>&1| cat /dev/null | grep -i toto >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi
echo -e "rm -rf toto" | rm -rf toto

sleep 0.1

echo "unsetenv, setenv, urandom, exec" ; echo -e "unsetenv PATH \n setenv PATH /bin:/dev/urandom\n mkdir toto \n rm -Rf toto \n ls -l " |./mysh > /dev/null 2>&1 | cat /dev/null | grep -i toto >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi

sleep 0.1

echo "relative no existant exec : " ; echo -e "/ls \n  ../bin/ls \n ./ls | cd /bin" |./mysh > /dev/null 2>&1 | cat /dev/null | grep -i toto >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi

sleep 0.1

echo "env -i and exec :" ; echo -e "setenv \n"  | env -i toto=titi ./mysh > titi 2>&1; grep -i "toto=titi" titi;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf titi" | rm -rf titi

sleep 0.1

echo "simple env -i and exec :" ; echo -e "ls \n" | env -i ./mysh > titi 2>&1 ; grep -i com titi;
if [ $? -eq 0 ] ;
         then echo ">OK" &i=$((i+1));
         else echo  "${red}KO${white}";
fi
echo -e "rm -rf titi" | rm -rf titi

sleep 0.1

echo "Paste directory : /bin and launch myls" ; echo -e "cp -Rf /bin/ls myls \n myls" | ./mysh > titi 2>&1 | cat titi | grep -i myls titi  >/dev/null ;
if [ $? -eq 0 ] ;
         then echo  "${red}KO${white}";
         else echo ">OK" &i=$((i+1));
fi
echo -e "rm -rf titi" | rm -rf titi
echo -e "rm -rf myls" | rm -rf myls

sleep 0.1

echo "                        Mark :" $i "/28" ; echo

echo "						Made by klein_h and leroy_0" ; echo
