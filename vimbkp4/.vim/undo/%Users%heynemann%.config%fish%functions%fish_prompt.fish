Vim�UnDo� �y�&hUL�n��u3!��d�����_�=   (                                  S�|F    _�                             ����                                                                                                                                                                                                                                                                                                                                                             S�9J     �               	set_color yellow5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S�9K     �                    set_color yellow5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S�9K     �                 set_color yellow5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�9L    �               set_color yellow5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v���    S�9�     �                  function fish_prompt      set_color yellow      printf '%s' (whoami)      set_color normal      printf ' at '          set_color magenta   '   printf '%s' (hostname|cut -d . -f 1)      set_color normal      printf ' in '          set_color $fish_color_cwd      printf '%s' (prompt_pwd)      set_color normal          # Line 2      echo      if test $VIRTUAL_ENV   O       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)      end      printf '↪ '      set_color normal   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v���    S�9�     �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v���    S�9�     �               5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                 v���    S�9�     �                  �               5�_�                 	           ����                                                                                                                                                                                                                                                                                                                                       /          v���    S�9�    �              .   9function fish_prompt --description 'Write out the prompt'   	   	set -l last_status $status       #	if not set -q __fish_prompt_normal   0		set -g __fish_prompt_normal (set_color normal)   	end       	# PWD   	set_color $fish_color_cwd   	echo -n (prompt_pwd)   	set_color normal       !	printf '%s ' (__fish_git_prompt)       	if not test $last_status -eq 0   	set_color $fish_color_error   	end       	echo -n '$ '       end       function fish_prompt      set_color yellow      printf '%s' (whoami)      set_color normal      printf ' at '          set_color magenta   '   printf '%s' (hostname|cut -d . -f 1)      set_color normal      printf ' in '          set_color $fish_color_cwd      printf '%s' (prompt_pwd)      set_color normal          # Line 2      echo      if test $VIRTUAL_ENV   O       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)      end      printf '↪ '      set_color normal   end5�_�   	      
                  ����                                                                                                                                                                                                                                                                                                                                       /          v���    S�;�     �                  9function fish_prompt --description 'Write out the prompt'   	   	set -l last_status $status       #	if not set -q __fish_prompt_normal   0		set -g __fish_prompt_normal (set_color normal)   	end       	# PWD   	set_color $fish_color_cwd   	echo -n (prompt_pwd)   	set_color normal       !	printf '%s ' (__fish_git_prompt)       	if not test $last_status -eq 0   	set_color $fish_color_error   	end       	echo -n '$ '       end5�_�                             ����                                                                                                                                                                                                                                                                                                                                       /          v���    S�|E     �                  function fish_prompt      set_color yellow      printf '%s' (whoami)      set_color normal      printf ' at '          set_color magenta   '   printf '%s' (hostname|cut -d . -f 1)      set_color normal      printf ' in '          set_color $fish_color_cwd      printf '%s' (prompt_pwd)      set_color normal          # Line 2      echo      printf '↪ '      set_color normal   end5�_�   	             
           ����                                                                                                                                                                                                                                                                                                                                       0          v���    S�9�     �                 5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                       F          v���    S�9�     �              �                function fish_prompt      set_color yellow      printf '%s' (whoami)      set_color normal      printf ' at '          set_color magenta   '   printf '%s' (hostname|cut -d . -f 1)      set_color normal      printf ' in '          set_color $fish_color_cwd      printf '%s' (prompt_pwd)      set_color normal          # Line 2      echo      if test $VIRTUAL_ENV   O       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)      end      printf '↪ '      set_color normal   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                       G          v���    S�9�     �         -       5�_�                    +        ����                                                                                                                                                                                                                                                                                                                                       H          v���    S�9�     �   +   ,   .       5�_�                    ,        ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�9�     �   ,   -   /    �   ,   -   /      !	printf '%s ' (__fish_git_prompt)5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�9�     �   ,   .   0       printf '%s ' (__fish_git_prompt)5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�9�     �   ,   .   0      !	printf '%s ' (__fish_git_prompt)5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�9�    �   ,   .   0      "	 printf '%s ' (__fish_git_prompt)5�_�                    ,        ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�9�    �         0      	�         0      	set -l last_status $status�         0      #	if not set -q __fish_prompt_normal�         0      0		set -g __fish_prompt_normal (set_color normal)�         0      	end�      
   0      	# PWD�   	      0      	set_color $fish_color_cwd�   
      0      	echo -n (prompt_pwd)�         0      	set_color normal�         0      !	printf '%s ' (__fish_git_prompt)�         0      	if not test $last_status -eq 0�         0      	set_color $fish_color_error�         0      	end�         0      	echo -n '$ '�   ,   .   0      "	 printf '%s ' (__fish_git_prompt)5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�:z     �   #   %   0         printf '%s' ()5�_�                     $       ����                                                                                                                                                                                                                                                                                                                                       I          v���    S�:{    �   #   %   0         printf '%s' (pwd)5��