
function download_latest_release() {
    eval "curl -s https://api.github.com/repos/$1/releases/latest | grep browser_download_url | grep $2 | cut -d : -f 2,3 | tr -d \\\" | wget -qi -"
}

ARTIFACT_NAME="cloud-torrent_linux_386"

echo "Downloading artifact, $ARTIFACT_NAME.gz"

download_latest_release jpillora/cloud-torrent 386

echo "Artifact $ARTIFACT_NAME.gz downloaded successfully"

echo "Unzipping Artifact $ARTIFACT_NAME.gz"

gunzip "$ARTIFACT_NAME.gz"

echo "Artifact $ARTIFACT_NAME.gz unzipped successfully"

chmod +x $ARTIFACT_NAME

ls -lah

nohup ./$ARTIFACT_NAME -h 0.0.0.0 -p 80 &
