#!/bin/bash
# Friedrich Clausen - Create new Ant webapp project
# ASSUMPTIONS:
# * CATALINA_HOME can be set outside of script
# * If no CATALINA_HOME then assumed in /usr/share/tomcat7 for Linux 
#   or <MACLOCATION> for OS X (default Cellar install)

template_proj="TEMPLATE"
# Which files have place holders
template_files=("build.properties")

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
        if [[ "$CATALINA_HOME" != "" ]]; then
            if [[ $os == "Linux" ]]; then
                if [[ -d "/usr/share/tomcat7/lib" ]]; then
                    catalina_home="/usr/share/tomcat7"
                else
                    echo "Can't automatically determine CATALINA_HOME, please set CATALINA_HOME manually"
                    exit 1
                fi
            elif [[ $os == "Darwin" ]]; then
                echo "TODO: Add darwin support"
                exit 0
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
        echo "Initialising new project directory : $newproj"
        cp -r $template_proj $newproj
        newproj=$(basename $newproj)

        for i in $template_files; do
            echo "Setting up $i"
            echo perl -p -i -e "s/@@APP_NAME@@/$newproj/" $i
            echo perl -p -i -e "s/@@CATALINA_HOME@@/$catalina_home/" $i
        done
}

#
# Main
#

sanity_check
setup_dir
