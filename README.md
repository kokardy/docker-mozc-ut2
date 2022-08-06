# docker-mozc-ut2

mozc-UT2をDockerでビルドするためのリポジトリ

## Usage

### Build deb packages

```bash
./build-deb.sh
```

or

```bash
./build-deb.sh --no-cache
```

You will find *deb in ./deb directory.

- emacs-mozc-bin_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- emacs-mozc_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- fcitx-mozc_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- ibus-mozc_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- mozc-data_2.23.2815.102+dfsg-8ubuntu1_all.deb
- mozc-server_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- mozc-utils-gui_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
- uim-mozc_2.23.2815.102+dfsg-8ubuntu1_amd64.deb

### Install deb packages

ex)
```bash
dpkg -i ./deb/mozc-server_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
dpkg -i ./deb/mozc-data_2.23.2815.102+dfsg-8ubuntu1_all.deb
dpkg -i ./deb/mozc-utils-gui_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
dpkg -i ./deb/ibus-mozc_2.23.2815.102+dfsg-8ubuntu1_amd64.deb
```
