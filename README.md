# otzarri-devops

Development and system administration tool set.

## Remote interactive installation (AchLinux/Manjaro, Debian/Ubuntu)

```
$ bash -c "$(curl -s https://gitlab.com/josebamartos/ost/-/raw/master/installer/remote-install.sh)"
```

## Remote unattended installation (AchLinux/Manjaro, Debian/Ubuntu)

To force the script to overwrite the existing configuration files:

```
$ bash -c "$(curl -s https://gitlab.com/josebamartos/ost/-/raw/master/installer/remote-install.sh)"
```

## Uninstallation

```
$ otzarri-devops-uninstall
```

## Tools

Tools are in [bin](bin) director and their respective config files are in [config](config) directory.

| Tool                            | Config                                    | Description                                                                     |
| ------------------------------- | ----------------------------------------- | ------------------------------------------------------------------------------- |
| [gitlab-init](bin/gitlab-init)  | [gitlab-init.cfg](config/gitlab-init.cfg) | Initializes git into current directory and pushes it to a new project in GitLab |
