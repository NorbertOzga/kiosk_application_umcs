#!/bin/bash

python -m coverage run --source=backend_application \
                       -m unittest discover \
&& \
python -m coverage report --skip-covered
