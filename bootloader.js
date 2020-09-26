
function download_latest_release() {
    eval "curl -s https://api.github.com/repos/$1/releases/latest | grep browser_download_url | grep $2 | cut -d : -f 2,3 | tr -d \\\" | wget -qi -"
}

ARTIFACT_NAME="cloud-torrent_linux_386"

download_latest_release jpillora/cloud-torrent 386

gunzip "$ARTIFACT_NAME.gz"

chmod +x $ARTIFACT_NAME

nohup ./$ARTIFACT_NAME -port 80 &
