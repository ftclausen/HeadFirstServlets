#!/bin/bash
# Friedrich Clausen - Create new Ant webapp project

template_proj="TEMPLATE"

if (( $# != 1 )); then
    echo "Usage: $0 new_project_name"
    exit 1
fi

newproj=$1

if [[ ! -d $template_proj ]]; then
    echo "ERROR: Cannot open template dir at $template_proj"
    exit 1
fi

template_files=("build.properties")

echo "Initialising new project directory : $newproj"
cp -r $template_proj $newproj
newproj=$(basename $newproj)

for i in $template_files; do
    echo "Setting up $i"
    perl -p -i -e "s/@@APP_NAME@@/$newproj/" $i
    perl -p -i -e "s/@@CATALINA_HOME@@/$catalina_home/" $i
done
