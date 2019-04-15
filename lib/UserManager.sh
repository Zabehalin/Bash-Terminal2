
function Menu()
{
echo -e "Enter\n1. New User\n2. Red User\n3. New UID / GIT \n0. Exit"
read choice

}
function CreateUser()
{
clear
echo -e "1. Username\n2. Username + uid\n3. Username + uid + git"
read userChoice
if (($userChoice == 1 ))
then 	
	echo "Enter User Name"
	read username
	useradd $username
elif (( $userChoice == 2))
then
	echo -e "Enter User Name"
	read username
	echo "Enter uid"
	read uid
	useradd $username -u $uid
elif (( $userChoice == 3 ))
then
	echo -e "Enter User Name"
	read username
	echo "Enter uid"
	read uid
	echo "Enter gid"
	read gid
	useradd $username -u $uid -g $gid
fi	
clear
}
function DeleteUser()
{
clear
echo -e "1. Delete User\n2. Nev pasword\n3. New name\n 4. New ( uid / gid ) "
read vybir
if (( $vybir == 1 ))
then
	echo -e "Enter User"
	read user
	cat /etc/passwd | grep $user
	if (($user == 0))
	then
		userdel $user -r
		echo "Success!"
	else
		echo "User dous not exist!"
	fi
elif (($vybir == 2))
then
	echo "Enter UserName!"
	read UserName
	cat /etc/passwd | grep $UserName
	if (($UserName == 0))
	then
		passwd $UserName
	else
		echo "User Dous not exit!"
	fi
elif (($vybir == 3))
then
	echo "Enter UserName:"
	read edituser
	cat /etc/passwd | grep $edituser
	if (($edituser == 0))
	then
		echo "Enter new name:"
		read newName
		usermod $edituser -l $newName
	else
		echo "User does not exit"
	fi
elif (($vybir == 4))
then 
	Newug;

	
fi

}
function Newug()
{
echo -e "1. New (uid)\n2. New (gid)\n3. New (uid/gid) "
read Vyb
if (($Vyb == 1))
	echo "Enter UserName"
	read username
	cat /etc/passwd | grep $username
	if (($username == 0))
	then
		echo "Enter New UID"
		read UserUID
		usermod -u $UserUID $username
	else
		echo "User dous not exit"
	fi
elif (($Vyb == 2))
then
	echo "Enter UserName"
	read username
	cat /etc/passwd | grep $username
	if (($username == 0))
	then
		echo "Enter New GID"
		read UserGID
		usermod -g $UserGID $username
	else
		echo "User dous not exit"
	fi
elif (($Vyb == 3))
then
	echo "Enter UserName"
	read username
	cat /etc/passwd | grep $username
	if (($username == 0))
	then
		echo "Enter New UID"
		read UserUID
		echo "Enter New GID"
		read UserGID
		usermod -u $UserUID -g $UserGID $username
	else 
		echo "User dous not exit"
	fi		



fi
}
clear
exit=true
while [ $exit == true ]
do
Menu;
case $choice in
	1) CreateUser; ;;
	2) DeleteUser; ;;
	3) Newug; ;;
	0) clear echo "B Y E!"; let exit=false ;;
	*) echo "E R O R"; ;;
esac

done

