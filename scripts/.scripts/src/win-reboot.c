#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
	setuid(geteuid());
	system("/usr/bin/grub-reboot Windows");
	printf("Reboot destination set. Rebooting...\n");
	system("/usr/bin/reboot");
	return 0;
}
