#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_arduino"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/Users/alessiature/progetto_workspace/install/lib/python3.9/site-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/Users/alessiature/progetto_workspace/install/lib/python3.9/site-packages:/Users/alessiature/progetto_workspace/build/lib/python3.9/site-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/Users/alessiature/progetto_workspace/build" \
    "/Users/alessiature/miniforge3/envs/ros_env/bin/python3.9" \
    "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_arduino/setup.py" \
     \
    build --build-base "/Users/alessiature/progetto_workspace/build/rosserial/rosserial_arduino" \
    install \
    --root="${DESTDIR-/}" \
     --prefix="/Users/alessiature/progetto_workspace/install" --install-scripts="/Users/alessiature/progetto_workspace/install/bin"
