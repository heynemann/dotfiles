function kill
    if [ "$argv" = "" ]
        echo "You must specify a program to kill!"
    else
        ps aux | egrep $argv | egrep -v egrep | awk ' { print $2 } ' | xargs kill -9
    end
end
