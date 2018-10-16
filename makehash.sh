#!/usr/bin/bash
#1234567890123456789012345678901234567890123456789012345678901234567890123456789
################################################################
# Displays a sha-512 (FIPS Complient) password hash for use with
# a kickstart script (ks.cfg) file.
#
# Rob Ramsey 18 Sep 2018
################################################################

# Check to make sure there are no arguments
if [ ! $# = 0 ]
	then
		echo "Invalid argument"
		echo ""
		echo "Usage: makehash.sh"
		echo "You will be prompted for the cleartext password"
		echo ""
		exit 1
fi

# Create a random eight character alphabetical string for use as salt
Salt=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 8 | head -n 1)

# This version of the python code prompts the user for salt then clear text password
#python -c "import crypt, getpass, pwd; print crypt.crypt(raw_input(), '\$6\$' + raw_input() + '\$')"

# This version of the python code takes the clear text password as an argument to the script
# and uses a hard coded salt
#python -c "import crypt, getpass, pwd; print(crypt.crypt('$Argument', '\$6\$SaltSalt\$'))"

# This version of the python code uses randome salt, generated above, and prompts the user for their
# password.
echo "Enter your clear text password and press the <Enter> key"
python -c "import crypt, getpass, pwd; print(crypt.crypt(raw_input(), '\$6\$${Salt}\$'))"

exit 0
