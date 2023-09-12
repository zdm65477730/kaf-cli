export GOPROXY=https://goproxy.cn,direct

#curl -OL https://github.com/ystyle/kaf-cli/releases/download/kindlegen/KindleGen_Mac_64bit_v2_9.zip
#curl -OL https://github.com/ystyle/kaf-cli/releases/download/kindlegen/kindlegen_win32_v2_9.zip
#curl -OL https://github.com/Technosoft2000/docker-calibre-web/releases/download/kindlegen/kindlegen_linux_2.6_i386_v2_9.tar.gz
#unzip -d darwin KindleGen_Mac_64bit_v2_9.zip
#unzip -d windows kindlegen_win32_v2_9.zip
#tar -zxf -c linux kindlegen_linux_2.6_i386_v2_9.tar.gz

GOOS=windows go build -ldflags "-s -w" -o kaf-cli.exe cmd/cli.go
GOOS=windows GOARCH=386 go build -ldflags "-s -w" -o kaf-cli_32.exe cmd/cli.go
GOOS=linux go build -ldflags "-s -w" -o kaf-cli-linux cmd/cli.go
GOOS=darwin go build -ldflags "-s -w" -o kaf-cli-darwin cmd/cli.go

zip -j kaf-cli-windows.zip windows/kindlegen.exe kaf-cli.exe kaf-cli_32.exe
zip -j kaf-cli-darwin.zip darwin/kindlegen-darwin kaf-cli-darwin
zip -j kaf-cli-linux.zip linux/kindlegen kaf-cli-linux

echo "done!"
