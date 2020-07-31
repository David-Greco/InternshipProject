Most of this is from https://github.com/bastilimbach/docker-MagicMirror

This is for testing modules from my internship project.

Run with this command:

docker run  -d --publish 80:8080 --restart always --volume ~/magic_mirror/config:/opt/magic_mirror/config --volume ~/magic_mirror/modules:/opt/magic_mirror/modules --volume /etc/localtime:/etc/localtime:ro --name magic_mirror davidgreco/magicmirrorproject
