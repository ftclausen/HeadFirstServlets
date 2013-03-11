#!/bin/bash
# Friedrich Clausen - uber basic script to build and deploy to tomcat
# TODO: Use maven or ant once JSP and servlets basics are done
# javac -cp /usr/local/Cellar/tomcat/7.0.37/libexec/lib/servlet-api.jar  -d classes/com/example/web src/com/example/web/BeerSelect.java

source_files=("src/com/example/model/BeerExpert.java src/com/example/web/BeerSelect.java")
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

rm -rf $classes
mkdir $classes

for file in $source_files; do
    echo "JAVAC: $file"
    if [[ ! "$file" =~ ^src ]]; then
        echo "ERROR: Src files must be in the \"src\" dir. $file is incorrect"
        exit 1
    fi 
    javac -cp $servlet_api:classes:. -d $classes $file
    if (( $? != 0 )); then
        echo "ERROR: Could not build $file"
        echo "Command line was : "
        echo "javac -cp $servlet_api:classes:. -d $classes $file"
        exit 1
    fi
done

if [[ ! -d "webapps" ]]; then
    echo "ERROR: Tomcat symlink not found or invalid"
    exit 1
fi

rm -rf webapps/$proj_name
mkdir -p webapps/$proj_name/WEB-INF/
cp -v etc/web.xml webapps/$proj_name/WEB-INF/web.xml
cp -v web/* webapps/$proj_name/
cp -rv classes webapps/$proj_name/WEB-INF/
