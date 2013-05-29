#!/bin/bash
# Friedrich Clausen - Create new Ant webapp project
# ASSUMPTIONS:
# * CATALINA_HOME can be set outside of script
# * If no CATALINA_HOME then assumed in /usr/share/tomcat7 for Linux 
#   or <MACLOCATION> for OS X (default Cellar install)

template_proj="TEMPLATE"
# Which files have place holders
template_files=("build.properties.template")

sanity_check() {
        if (( $# != 1 )); then
            echo "Usage: $0 new_project_name"
            exit 1
        fi
        newproj=$1

        if [[ ! -d $template_proj ]]; then
            echo "ERROR: Cannot open template dir at $template_proj"
            exit 1
        fi
       
        os=$(uname -s) 
        if [[ "$CATALINA_HOME" == "" ]]; then
            if [[ $os == "Linux" ]]; then
                catalina_home="/usr/share/tomcat7/lib"
            elif [[ $os == "Darwin" ]]; then
                catalina_home="/usr/local/Cellar/tomcat/7.0.37/libexec"
            else
                echo "Cannot determine CATALINA_HOME, please set CATALINA_HOME manually"
                exit 1
            fi
            if [[ ! -d "$catalina_home" ]]; then
                echo "CATALINA_HOME at $catalina_home does not exist. Please check or set manually."
                exit 1
            fi
        else
            echo "Using environmentally set CATALINA_HOME"
            if [[ ! -d "$CATALINA_HOME/lib" ]]; then
                echo "Dir \"$CATALINA_HOME\" does not appear to be a valid tomcat installation"
                exit 1
            fi
        fi
}


setup_dir() {
        cp -r $template_proj $newproj
        ./mkbuildprops.sh $newproj
}

#
# Main
#

sanity_check $@
setup_dir
