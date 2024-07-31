source ~/.zshrc
name="pin"
folder="${JAP_FOLDER}plugins/packages/${name}/"
folder_config="${folder}config/"
mkdir $folder_config
fetch2 $folder "https://raw.githubusercontent.com/philipstuessel/$name/main/$name.zsh"
echo {} > "${folder_config}pins.json"
echo "--PIN is installed--"