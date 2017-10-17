#!/bin/bash
#Background Colors
E=$(tput sgr0);    R=$(tput setab 1); G=$(tput setab 2); Y=$(tput setab 3);
B=$(tput setab 4); M=$(tput setab 5); C=$(tput setab 6); W=$(tput setab 7);
function e() { echo -e "$E"; }
function x() { echo -n "$E  "; }
function r() { echo -n "$R  "; }
function g() { echo -n "$G  "; }
function y() { echo -n "$Y  "; }
function b() { echo -n "$B  "; }
function m() { echo -n "$M  "; }
function c() { echo -n "$C  "; }
function w() { echo -n "$W  "; }

#putpixels
function u() {
    h="$*";o=${h:0:1};v=${h:1};
    for i in `seq $v`
    do
        $o;
    done
}

img="\
x40 e1 x40 e1 x40 e1 x40 e1 x40 e1 x40 e1 x40 e1 x40 e1 x18 y1 x21 e1 x17 y3 x20 e1 x16 y5 x19 e1 x15 y7 x18 e1 x14 y9 x17 e1 x13 y11 x16 e1 x12 y1 x11 y1 x15 e1 x11 y3 x9 y3 x14 e1 x10 y5 x7 y5 x13 e1 x9 y7 x5 y7 x12 e1 x8 y9 x3 y9 x11 e1 x7 y11 x1 y11 x10 e1 x40 e1 x40 e1 x40"

for n in $img
do
    u $n
done
e;
exit 0;
