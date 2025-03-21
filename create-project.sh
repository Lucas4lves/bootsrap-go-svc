echo "#################################"
echo "# BOOTSTRAP YOUR GOLANG SERVICE #"
echo "#################################"

echo "Checking dependecies..."
if command -v git > /dev/null; then 
    echo "git [x]"
else 
    echo "Install 'git' to use this script"
    exit 1
fi

if command -v go > /dev/null; then 
    echo "go [x]"

else 
    echo "Install 'go' to use this script"
    exit 1
fi

mkdir test_project && cd test_project

git_user_name=$(git config user.name)

read -p "Project name: " project_slug

read -p "Are your sure? [Y/n]" option

if [[ $option == [yY] ]]; then 
    echo ""
else 
    echo "Aborting..."
    exit 1
fi

module_name="github.com/$git_user_name/$project_slug"

go mod init $module_name

mkdir -p cmd/api && touch cmd/api/main.go

cat <<EOF >./cmd/api/main.go
package main

import "fmt"

func main(){
    fmt.Println("This is a test service!")
}
EOF

mkdir configuration model repository usecase utils