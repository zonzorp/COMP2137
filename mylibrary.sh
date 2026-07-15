verbose=no
progname="$(basename $0)"

function errormessage (
	if [ "$verbose" = "yes" ]; then
		echo "$(date +%H:%M:%S) $progname : ***** WARNING ***** $1"
	else
		echo "$(date +%H:%M:%S) $progname : ***** WARNING ***** $1" >> mylog.log
	fi
)

function fatalerrorexit (
	errormessage "$1"
	exit 1
)

function logmessage (
	echo "$(date +%H:%M:%S) $progname : $1" >> mylog.log
)


