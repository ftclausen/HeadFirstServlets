#!/bin/bash
# Friedrich Clausen - uber basic script to build and deploy to tomcat
# TODO: Use maven or ant once JSP and servlets basics are done
# javac -cp /usr/local/Cellar/tomcat/7.0.37/libexec/lib/servlet-api.jar  -d classes/com/example/web src/com/example/web/BeerSelect.java

if [[ ! -d src ]]; then
    echo "ERROR: Please run me from the project base directory."
    exit 1
fi

proj_name=$(basename $PWD)

if [[ "$HOSTNAME" == "fapple" ]]; then
    servlet_api="/usr/local/Cellar/tomcat/7.0.37/libexec/lib/servlet-api.jar"
elif [[ "$HOSTNAME" == "lem" ]]; then
    servlet_api="/usr/share/tomcat7/lib/servlet-api.jar"
else
    echo "Run this on fapple or lem"
    exit 1
fi

echo "Starting build and deploy for $proj_name"

classes="classes"
src="src"
webapps="../webapps"

rm -rf $classes
mkdir $classes

if [[ -f "deps.txt" ]]; then
    echo "DEBUG: Using dependencies specified in deps.txt"
    files=$(cat deps.txt)
else
    files=$(find src/ -name '*.java')
fi

echo "JAVAC: $files"
if [[ ! "$files" =~ ^src ]]; then
    echo "ERROR: Src files must be in the \"src\" dir. $file is incorrect"
    exit 1
fi 
javac -cp $servlet_api:classes:. -d $classes $files
if (( $? != 0 )); then
    echo "ERROR: Could not build $files"
    echo "Command line was : "
    echo "javac -cp $servlet_api:classes:. -d $classes $files"
    exit 1
fi

if [[ ! -d "$webapps" ]]; then
    echo "ERROR: Tomcat symlink not found or invalid"
    exit 1
fi

rm -rf $webapps/$proj_name
mkdir -p $webapps/$proj_name/WEB-INF/
cp -v etc/web.xml $webapps/$proj_name/WEB-INF/web.xml
if (( $(ls web/* 2>/dev/null | wc -l | awk '{print $1}') > 0 )); then
    cp -v web/* $webapps/$proj_name/
fi
cp -rv classes $webapps/$proj_name/WEB-INF/
