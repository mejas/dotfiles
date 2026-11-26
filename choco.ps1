iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

(cat .\packages.txt) | %{ choco install $_ -y }