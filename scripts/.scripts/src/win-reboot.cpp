#include <iostream>
#include <unistd.h>
using namespace std;

int main()
{
	setuid(geteuid());
	system("grub-reboot Windows && reboot");
	return 0;
}

