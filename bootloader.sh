
function download_latest_release() {
    eval "curl -s https://api.github.com/repos/$1/releases/latest | grep browser_download_url | grep $2 | cut -d : -f 2,3 | tr -d \\\" | wget -qi -"
}

#ARTIFACT_NAME="cloud-torrent_linux_386"
ARTIFACT_NAME="cloud-torrent_linux_386_static"

echo "Downloading artifact, $ARTIFACT_NAME.gz"

#download_latest_release jpillora/cloud-torrent 386
download_latest_release boypt/simple-torrent 386

echo "Artifact $ARTIFACT_NAME.gz downloaded successfully"

echo "Unzipping Artifact $ARTIFACT_NAME.gz"

gunzip "$ARTIFACT_NAME.gz"

echo "Artifact $ARTIFACT_NAME.gz unzipped successfully"

chmod +x $ARTIFACT_NAME

# Adding initial config file
mkdir "$HOME/.cloud-torrent"
touch "$HOME/.cloud-torrent/cloud-torrent.yaml"

./$ARTIFACT_NAME --port $PORT --auth "$AUTH_USER:$AUTH_PASSWORD"
