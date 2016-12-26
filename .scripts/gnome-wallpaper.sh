#!/bin/bash

WP_DIR=/home/tripleheader/.wallpapers

cd $WP_DIR
while [ 1 ] 
	  do
		    set -- * 
		      length=$#
		        random_num=$((( $RANDOM % ($length) ) + 1)) 

			  gsettings set org.gnome.desktop.background picture-uri "file://$WP_DIR/${!random_num}"

			    sleep 600 
		    done
