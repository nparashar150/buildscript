#!/usr/bin/env sh
set -e

GO_VERSION="1.25.6"
GO_BIN="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_BIN}"
GOROOT="/home/ubuntu/go"
GOPATH="$HOME/Apps/app1"
PROFILE="$HOME/.profile"

echo "==> Downloading Go ${GO_VERSION} binary"
cd /tmp
wget -q ${GO_URL}

echo "==> Preparing GOROOT"
mkdir -p "${GOROOT}"

echo "==> Installing Go"
rm -rf "${GOROOT:?}/*"
tar -xzf ${GO_BIN}
mv go/* "${GOROOT}/"

echo "==> Setting env vars"
mkdir -p "${GOPATH}/bin"

# avoid duplicates
grep -q "GOROOT=${GOROOT}" "$PROFILE" 2>/dev/null || {
  {
    echo ""
    echo "# Go env"
    echo "export GOROOT=${GOROOT}"
    echo "export GOPATH=${GOPATH}"
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH'
  } >> "$PROFILE"
}

echo ""
echo "======================================"
echo "Go installed successfully ✅"
echo "To finish, run:"
echo "  source ~/.profile"
echo "Then verify with:"
echo "  go version"
echo "======================================"
